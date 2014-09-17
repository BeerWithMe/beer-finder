// This file starts our server, we defer to localhost:3000
// if a process port and url are not defined
var app = require('./server/server.js');
var db = require('./server/dbConfig.js')
var port = process.env.PORT || 3000;
var url = process.env.URL || 'localhost';

app.listen(port, url);

console.log('Listening on', url, ':', port);



// var http = require('http');
// var express = require('express');
// var path = require('path');
// var bodyParser = require('body-parser');
// var app = express();
// require('./routes.js')(app);


// app.set('port', process.env.PORT || 3000);


// //this tells Express to parse the incoming body data.  This will be called before other 
// //route handlers, to req.body can be passed directly to driver code as js object.
// app.use(bodyParser());

// //this tells press to use express.static middleware to serve files in response to incoming requests
// //maps local subfolder 'public' (which we don't have yet) to the base route '/'
// //'path' module creates a platform-independent subfolder string. 
// //anything in /public can now be accessed by name. 
// app.use(express.static(path.join(__dirname, 'public')));  

var insertIntoDB = function(beerObj){
  console.log('inside insertIntoDB()')
  var params = {
    //fix these properties
    Name: beerObj.name,
    IBU: beerObj.IBU,
    ABV: beerObj.ABV,
    Description: beerObj.description,
    Imgurl: beerObj.imgUrl,
    Location: beerObj.locaiton
  }
  db.query('CREATE (n:Beer {Name: ({Name}), IBU: ({IBU}), ABV: ({ABV}), Description: ({Description}), Imgurl: ({Imgurl}) })', params, function(err){
    if(err){ console.log(err); } else {
      console.log('successfully created beer node')
    }
  })
}

var beerNode = {
  name: 'MikeBeer',
  IBU: 800,
  ABV: '.20',
  Description: 'good beer',
  Imgurl: 'undefined',
  Location: 'America'
}

insertIntoDB(beerNode)
var beerget = function(path) {
  //deleted the url and key to push to github since it's a public repo.
  var beerDBurl = 'http://api.brewerydb.com/v2/'
  var key = '7cce543c5ae17da2dba68c674c198d2d'
  var requestUrl = beerDBurl + path + '/?key=' + key

  http.get(requestUrl, function(res) {
    console.log(res);
  }).on('error', function(e) {
    console.log('There was an error: ' + e.message);
  })
};
      
// beerget('/beer'); 
