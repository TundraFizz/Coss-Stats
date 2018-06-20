var fs = require("fs");

function Log(){}

Log.prototype.Write = function(msg){
  fs.appendFile("log/log-coss-stats.txt", msg + "\n", function(err){
    if(err)
      return;
    console.log(err);
  });
};

module.exports = new Log;
