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
          var total       = parseFloat(results[2]).toFixed(8);
          var transferred = (results[3] == "") ? "" : parseFloat(results[3]).toFixed(8);
          var remaining   = parseFloat(results[4]).toFixed(8);

          obj[token] = {
            "total"              : total,
            "transferred"        : transferred,
            "remaining"          : remaining,
            "valueUsdTotal"      : "",
            "valueUsdTransferred": "",
            "valueUsdRemaining"  : ""
          };
        }catch(err){
          res.status(200).json({"error":errorMessage});
          return;
        }
      }

      var sql  = "SELECT symbol_coss, value FROM value";
      var args = [];

      db.query(sql, args, function(err, rows){
        // Go through every recorded crypto in my database
        for(r in rows){
          var symbol = rows[r]["symbol_coss"];
          var value  = rows[r]["value"];

          if(value === null){
            // A null value means that the value currently isn't recorded on CMC
            // Because we don't know the value, set the total and remaining to zero
            obj[symbol]["valueUsdTotal"]     = "0.00000000";
            obj[symbol]["valueUsdRemaining"] = "0.00000000";

            // If we've done any transfers, set it to zero as well
            if(obj[symbol]["transferred"])
              obj[symbol]["valueUsdTransferred"] = "0.00000000";
          }else{
            // The value is recorded on CMC
            // Multiply the total, transferred, and remaining amounts by the value
            // Fix the number to eight decimal places
            obj[symbol]["valueUsdTotal"]       = parseFloat(value * obj[symbol]["total"]).toFixed(8);
            obj[symbol]["valueUsdTransferred"] = parseFloat(value * obj[symbol]["transferred"]).toFixed(8);
            obj[symbol]["valueUsdRemaining"]   = parseFloat(value * obj[symbol]["remaining"]).toFixed(8);

            // Any value that is nothing gets set to an empty string
            if(obj[symbol]["valueUsdTransferred"] == "0.00000000")
              obj[symbol]["valueUsdTransferred"] = "";
          }
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
