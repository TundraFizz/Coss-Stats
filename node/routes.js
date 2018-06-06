var app        = require("../server.js");
var fs         = require("fs");
var mysql      = require("mysql");
var formidable = require("formidable");

var db = mysql.createConnection({
    host    : "127.0.0.1",
    user    : "root",
    password: "",
    database: "coss"
});

app.get("/", function(req, res){
  res.render("index.ejs");
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

app.use(function (req, res){
  res.render("404.ejs");
});
