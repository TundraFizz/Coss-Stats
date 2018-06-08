var request = require("request");
var cheerio = require("cheerio");
var moment  = require("moment");
var mysql   = require("mysql");
var fs      = require("fs");

function Log(msg){fs.appendFile("log.txt", msg + "\n", function(err){if(err) return console.log(err);}); }

var db = mysql.createConnection({
    host    : "127.0.0.1",
    user    : "root",
    password: "",
    database: "coss"
});

//////////////////////////
// Crypto Value Updater //
//////////////////////////

var index = 0;
var lock  = false;

function UpdateCrypto(){
  if(lock) return;
  else     lock = true;

  var sql  = "SELECT id, name, symbol_cmc, symbol_coss FROM value";
  var args = [];

  db.query(sql, args, function(err, rows){
    if(rows.length == 0){
      Log("No entries exist, trying again in five seconds");
      lock = false;
      return;
    }else if(index == rows.length){
      index = 0;
    }

    var id         = rows[index]["id"];
    var name       = rows[index]["name"];
    var symbolCmc  = rows[index]["symbol_cmc"];
    var symbolCoss = rows[index]["symbol_coss"];

    request("https://api.coinmarketcap.com/v2/listings/", {"json":"true"}, function(error, res, obj){
      var data  = obj["data"];
      var tests = 0;

      for(d in data){
        var cmcName   = data[d]["name"];
        var cmcSymbol = data[d]["symbol"];

        if(cmcName == name && cmcSymbol == symbolCmc){
          request(`https://api.coinmarketcap.com/v2/ticker/${data[d]["id"]}/?convert=USD`, {"json":"true"}, function(error, res, obj){
            var value = obj["data"]["quotes"]["USD"]["price"];

            var sql  = "UPDATE value SET value=? WHERE id=?";
            var args = [value, id];

            db.query(sql, args, function(err, rows){
              // Log(`${symbolCmc} updated`);
              index++;
              lock = false;
              return;
            });
          });
        }else if(++tests == data.length){
          // Log(`${symbolCmc} doesn't exist in CMC`);
          index++;
          lock = false;
          return;
        }
      }
    });
  });
}

// Rate Limit: No more than 30/minute
// Safe Limit: Once every five seconds
var timerId = setInterval(UpdateCrypto, 5000);

////////////////////
// Volume Updater //
////////////////////

setInterval(()=>{
  // Check if I'm on the hour (minute == 0)
  if(moment().minute() == 0){
    var url = "https://coinmarketcap.com/exchanges/coss/";

    request(url, function(err, res, html){
      if(err) return;

      var now   = moment();
      var year  = now.year();
      var month = now.month() + 1;
      var day   = now.date();
      var hour  = now.hour();
      var date  = `${year}-${month}-${day} ${hour}:00:00`;

      var $ = cheerio.load(html);
      var volume = $($("[data-currency-volume]")[0]).attr("data-usd");
      volume = Math.floor(volume);

      var sql  = "INSERT INTO volume (date, volume) VALUES (?, ?)";
      var args = [date, volume];
      db.query(sql, args, function(err, rows){
        return;
      });
    });
  }
}, 30000); // Run this function every 30 seconds
