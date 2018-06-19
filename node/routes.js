var app        = require("../server.js");
var fs         = require("fs");
var mysql      = require("mysql");
var moment     = require("moment");
var formidable = require("formidable");
var emailer    = require("nodemailer");

var db = mysql.createConnection({
  "host"    : app["data"]["mysql"]["host"],
  "user"    : app["data"]["mysql"]["user"],
  "password": app["data"]["mysql"]["password"],
  "database": app["data"]["mysql"]["database"]
});

function GetCossValue(){return new Promise((done) => {
  var sql = "SELECT value FROM value WHERE name='COSS'";

  db.query(sql, function(err, rows){
    done(rows[0]["value"]);
  });
})}

function GetVolumeHistory(){return new Promise((done) => {
  var sql  = "SELECT date, volume FROM volume ORDER BY id DESC";
  var args = [];
  var volumeHistory = [];

  db.query(sql, args, function(err, rows){
    for(r in rows){
      volumeHistory.push({
        "date"  : rows[r]["date"],
        "volume": rows[r]["volume"]
      });
    }

    done(volumeHistory);
  });
})}

function GetWeeklyRewards(){return new Promise((done) => {
  var sql  = "SELECT eth_block, date, volume, value, fee FROM weekly_rewards ORDER BY id DESC";
  var args = [];
  var weeklyRewards = [];

  db.query(sql, args, function(err, rows){
    for(r in rows){
      weeklyRewards.push({
        "ethBlock": rows[r]["eth_block"],
        "date"    : rows[r]["date"],
        "volume"  : rows[r]["volume"],
        "value"   : rows[r]["value"],
        "fee"     : rows[r]["fee"]
      });
    }

    done(weeklyRewards);
  });
})}

function GetNextEthBlock(){return new Promise((done) => {
  var sql = "SELECT date FROM next_eth_block WHERE id=1";
  db.query(sql, function(err, rows){
    done(rows[0]["date"]);
  });
})}

app.get("/", function(req, res){
  var data = {};

  GetCossValue()
  .then((r) => {
    data["cossValue"] = r;

    GetVolumeHistory()
    .then((r) => {
      data["volumeHistory"] = r;

      GetWeeklyRewards()
      .then((r) => {
        data["weeklyRewards"] = r;

        GetNextEthBlock()
        .then((r) => {
          data["nextEthBlock"] = r;

          res.render("index.ejs", data);
        });
      });
    });
  });
});

app.post("/upload-fee-split", function(req, res){
  var errorMessage = "Bad file, no results were processed. If you're certain that the file is good, then send me an email at example@gmail.com";
  var form = new formidable.IncomingForm();

  form.parse(req, function(err, fields, files){
    var path = files.files.path;
    var size = files.files.size;
    var ext  = files.files.name.split(".").pop();

    // The file must be a .csv and must also be less than 10,000 bytes
    if(size > 10000 || ext != "csv"){
      res.status(200).json({"error":errorMessage});
      return;
    }

    fs.readFile(path, "utf-8", function(err, data){
      var obj = {};

      // coss.io saves the .csv file with BOM, so the BOM markers
      // need to be removed with the following replace method
      data = data.replace(/^\uFEFF/, "");

      // Go through every line that starts with a double-quote
      data = data.split("\n");

      for(i in data){
        var line = data[i];
        if(line[0] != "\"")
          continue;

        // The order of the csv fields are:
        //   1. Token
        //   2. Total amount you've received
        //   3. Amount you've transferred to your wallet
        //   4. Remaining amount you can transfer
        var results = /"(.*)","(.*)","(.*)","(.*)"/.exec(line);
        try{
          var token     = results[1];
          var remaining = parseFloat(results[4]).toFixed(8);

          obj[token] = {
            "remaining"  : remaining,
            "fsaValue"   : 0,
            "fee"        : 0,
            "netValue"   : 0,
          };
        }catch(err){
          res.status(200).json({"error":errorMessage});
          return;
        }
      }

      // I need to get the current value of Ethereum in order to calculate the 0.001 ETH fee
      var sql = "SELECT value FROM value WHERE name='Ethereum'";
      db.query(sql, function(err, rows){
        var ethFee = rows[0]["value"] * 0.001;
        ethFee = ethFee.toFixed(2);

        var sql  = "SELECT symbol_coss, value, fee FROM value";
        var args = [];

        db.query(sql, args, function(err, rows){
          // Go through every recorded crypto in my database
          for(r in rows){
            var symbol = rows[r]["symbol_coss"];
            var value  = rows[r]["value"];
            var fee    = rows[r]["fee"];

            if(value === null){
              // A null value means that the value currently isn't recorded on CMC
              // Because I don't know how much it's worth, set value to zero
              obj[symbol]["fsaValue"] = "0.00";
              obj[symbol]["fsaValue"] = "???";
            }else{
              // The value is recorded on CMC
              // Multiply the remaining amount by the value and fix the number to eight decimal places
              // This will round to the nearest cent (>= 5 up; <5 down)
              obj[symbol]["fsaValue"] = parseFloat(value * obj[symbol]["remaining"]).toFixed(2);
            }

            // Fee structure:
            //   0: No fee, you can distribute it into the appropiate wallet
            //   1: A fee of 0.001 ETH to convert it into ETH
            //   ETH: NO fee, but you need at least 0.01 ETH to distribute it into your ETH wallet
            //   DISABLED: Unkown at this time because it's disabled
            if(fee == "0"){
              obj[symbol]["fee"] = 0;
            }else if(fee == "1"){
              obj[symbol]["fee"] = ethFee;
            }else if(fee == "ETH"){
              obj[symbol]["fee"] = 0;
            }else if(fee == "DISABLED"){
              obj[symbol]["fee"] = "DISABLED";
            }

            obj[symbol]["netValue"] = obj[symbol]["fsaValue"] - obj[symbol]["fee"];
            obj[symbol]["netValue"] = obj[symbol]["netValue"].toFixed(2);

            if(obj[symbol]["netValue"] < 0)
              obj[symbol]["netValue"] = 0;

            if(obj[symbol]["fee"] == "DISABLED")
              obj[symbol]["netValue"] = "Can't distribute"
            else if(obj[symbol]["fsaValue"] == "???")
              obj[symbol]["netValue"] = "Unkown";
          }

          res.status(200).json(obj);
          fs.unlink(path, function(err){});
          return;
        });
      });
    });
  });
});

app.post("/send-feedback", function(req, res){
  var ip = req.headers["x-real-ip"];

  if(ip === undefined || ip === null){
    res.json({"msg":"Bad IP address", "err":"false"});
    return;
  }

  var sql  = "SELECT date FROM feedback_ip WHERE ip=?";
  var args = [ip];

  db.query(sql, args, function(err, rows){
    console.log(rows.length);
    if(rows.length == 0){
      console.log("This person has never left feedback before, insert a new row");

      var sql  = "INSERT INTO feedback_ip (ip) VALUES (?)";
      var args = [ip];

      db.query(sql, args, function(err, rows){
        console.log("The row has been inserted");
        // console.log(err);
        // console.log("--------------------");
        // console.log(rows);
        // console.log("--------------------");


        var message     = req["body"]["message"];
        var username    = app["data"]["email"]["username"];
        var password    = app["data"]["email"]["password"];
        var sendEmailTo = app["data"]["sendEmailTo"];

        var transporter = emailer.createTransport({
          "service": "gmail",
          "auth": {
            "user": username,
            "pass": password
          }
        });

        var mailOptions = {
          "from"   : username,
          "to"     : sendEmailTo,
          "subject": "coss-stats.io feedback",
          "text"   : message
        };

        transporter.sendMail(mailOptions, function(error, info){
          res.json({"msg":"Message sent", "err":"false"});
          return;
        });
      });
    }else{
      console.log("This person HAS left feedback; check for 24 hours");
      var then      = rows[0]["date"];
      var countdown = moment.duration(moment(moment()).diff(then));

      if(countdown.days() > 0){
        var sql  = "UPDATE feedback_ip SET date=NOW() WHERE ip=?";
        var args = [ip];

        db.query(sql, args, function(err, rows){
          console.log("YES");
          res.json({"msg":"Message sent", "err":"false"});
          return;
        });
      }else{
        console.log("NO");
        res.json({"msg":"You must wait at least 24 hours before sending another email", "err":"false"});
        return;
      }
    }
  });
});

app.use(function (req, res){
  res.redirect("/");
  // res.render("404.ejs");
});
