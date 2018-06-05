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
        var results     = /"(.*)","(.*)","(.*)","(.*)"/.exec(line);
        try{
          var token       = results[1];
          var total       = results[2];
          var transferred = results[3];
          var remaining   = results[4];

          obj[token] = {
            "total"              : total,
            "transferred"        : transferred,
            "remaining"          : remaining,
            "valueUsdTotal"      : 0,
            "valueUsdTransferred": 0,
            "valueUsdRemaining"  : 0
          };
        }catch(err){
          res.status(200).json({"error":errorMessage});
          return;
        }
      }

      var sql  = "SELECT symbol_coss, value FROM value";
      var args = [];

      db.query(sql, args, function(err, rows){
        for(r in rows){
          var symbol = rows[r]["symbol_coss"];
          var value  = rows[r]["value"];

          obj[symbol]["valueUsdTotal"]       = value * obj[symbol]["total"];
          obj[symbol]["valueUsdTransferred"] = value * obj[symbol]["transferred"];
          obj[symbol]["valueUsdRemaining"]   = value * obj[symbol]["remaining"];
        }

        res.status(200).json(obj);
        fs.unlink(path, function(err){});
        return;
      });
    });
  });
});

app.use(function (req, res){
  res.render("404.ejs");
});
