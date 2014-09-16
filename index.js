var http = require('http');
var express = require('express');
var path = require('path');

var app = express();
app.set('port', process.env.PORT || 3000);
//this tells press to use express.static middleware to serve files in response to incoming requests
//maps local subfolder 'public' (which we don't have yet) to the base route '/'
//'path' module creates a platform-independent subfolder string. 
//anything in /public can now be accessed by name. 
app.use(express.static(path.join(__dirname, 'public')));  

//this was set up to test that the server was working.  Will modify based on Swift. 
app.get('/', function (req, res) {
  res.send('<html><body><h1>Hello World</h1></body></html>');
});

//catch-all route to display a 404 when requested content not found.
//this would load the 404 page if the code gets here without res.send() having been called. 
//however, it's currently written to use the Jade templating engine.  Not sure what we'll use for swift. 
app.use(function(req, res) {
  res.render('404', {url:req.url}); 
});

http.createServer(app).listen(app.get('port'), function(){
  console.log('Server listening on port ' + app.get('port'));
});