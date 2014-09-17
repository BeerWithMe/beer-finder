// This file starts the server and connects to the database.
// Exporting the app and express methods allows us to defer to
// the middleware to handle all routing
var express = require('express');
var app = express();

// require('./config/middleware.js')(app, express);
module.exports = app;