var fs     = require("fs");
var moment = require("moment");

function Log(){}

Log.prototype.Write = function(msg, consoleLog = false){
  var now = moment().format("MMM DD, YYYY @ HH:mm:ss");
  msg = `${now}: ${msg}\n`;

  if(consoleLog)
    console.log(msg);

  fs.appendFile("log/log-coss-stats.txt", msg, function(err){
    if(err)
      console.log(err);
  });
};

module.exports = new Log;
