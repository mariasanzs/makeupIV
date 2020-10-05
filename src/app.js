var express = require("express");
var bodyParser = require("body-parser");
var methodOverride = require("method-override");
var mongoose = require('mongoose');

var app = express();

app.set('appName', 'MakeupIV');
app.set('port', process.env.PORT || 3000);
app.set('json spaces', 2);

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(methodOverride());

var router = express.Router();

router.get('/', function(req, res) {
  res.send("Bienvenido a MakeupIV");
});

app.use(router);

app.listen(apt.get('port'), () =>){
  console.log("Node server running on http://localhost:", app.get('port'));
});
