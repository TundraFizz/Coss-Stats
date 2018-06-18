var fs         = require("fs");                   // File system
var express    = require("express");              // Express
var bodyParser = require("body-parser");          // Allows you to read POST data
var sass       = require("node-sass-middleware"); // SASS
var app        = module.exports = express();      // Define the application

fs.readFile("secrets.json", "utf-8", function(err, data){
  module.exports.data = JSON.parse(data);

  app.set("views", "./views");                      // Define the views directory
  app.use(express.static("./static"));              // Define the static directory
  app.use(bodyParser.urlencoded({extended: true})); // Setting for bodyParser
  app.use(sass({src:   __dirname + "/static/css/sass",
                dest:  __dirname + "/static/css",
                prefix: "/css",
                outputStyle: "compressed"}));
  require("./node/routes.js");
  require("./node/value-updater.js");
  app.listen(80); // Start the server
});
