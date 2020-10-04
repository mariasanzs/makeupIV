var express = require("express");
var bodyParser = require("body-parser");
var methodOverride = require("method-override");
var mongoose = require('mongoose');

var app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(methodOverride());

var router = express.Router();

router.get('/', function(req, res) {
  res.send("Bienvenido a MakeupIV");
});

app.use(router);

app.listen(3000, function() {
  console.log("Node server running on http://localhost:3000");
});
