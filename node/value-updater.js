var app     = require("../server.js");
var log     = require("./log.js");
var request = require("request");
var cheerio = require("cheerio");
var moment  = require("moment");
var mysql   = require("mysql");
var fs      = require("fs");

var db = mysql.createConnection({
  "host"    : app["data"]["mysql"]["host"],
  "user"    : app["data"]["mysql"]["user"],
  "password": app["data"]["mysql"]["password"],
  "database": app["data"]["mysql"]["database"]
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
    if(err){
      log.Write(err);
      return;
    }

    if(rows.length == 0){
      log.Write("No entries exist, trying again in five seconds");
      lock = false;
      return;
    }else if(index == rows.length){
      log.Write("Setting the index to ZERO");
      index = 0;
    }

    var id         = rows[index]["id"];
    var name       = rows[index]["name"];
    var symbolCmc  = rows[index]["symbol_cmc"];
    var symbolCoss = rows[index]["symbol_coss"];

    log.Write(`Updating value at ID: ${id}`);

    request("https://api.coinmarketcap.com/v2/listings/", {"json":"true"}, function(err, res, obj){
      if(err){
        log.Write(err);
        return;
      }

      // log.Write(JSON.stringify(obj));
      var data  = obj["data"];
      var tests = 0;

      for(d in data){
        var cmcName   = data[d]["name"];
        var cmcSymbol = data[d]["symbol"];

        if(cmcName == name && cmcSymbol == symbolCmc){
          request(`https://api.coinmarketcap.com/v2/ticker/${data[d]["id"]}/?convert=USD`, {"json":"true"}, function(err, res, obj){
            if(err){
              log.Write(err);
              return;
            }

            // log.Write(JSON.stringify(obj));
            var value = obj["data"]["quotes"]["USD"]["price"];
            var sql   = "UPDATE value SET value=? WHERE id=?";
            var args  = [value, id];

            db.query(sql, args, function(err, rows){
              if(err){
                log.Write(err);
                return;
              }

              index++;
              lock = false;
              return;
            });
          });
        }else if(++tests == data.length){
          index++;
          lock = false;
          return;
        }
      }
    });
  });
}

////////////////////
// Volume Updater //
////////////////////
function UpdateVolume(){
  // Check if I'm on the hour (minute == 0)
  // if(moment().minute() == 0){
  if(true){
    var url = "https://coinmarketcap.com/exchanges/coss/";

    request(url, function(err, res, html){
      if(err){
        log.Write(err, true);
        return;
      }

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
        if(err)
          log.Write(err, true);
      });
    });
  }
}

// Rate Limit: No more than 30/minute
// Safe Limit: Once every five seconds
var timerUpdateCrypto = setInterval(UpdateCrypto, 5000);
var timerUpdateVolume = setInterval(UpdateVolume, 3000);
