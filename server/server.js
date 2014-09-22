// This file starts the server and connects to the database.
// Exporting the app and express methods allows us to defer to
// the middleware to handle all routing
var express = require('express');
var app = express();
require('./config.js')(app,express);
require('./routes.js')(app);
module.exports = app;

