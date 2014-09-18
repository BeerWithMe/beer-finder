// This file starts our server, we defer to localhost:3000
// if a process port and url are not defined
var app = require('./server/server.js');
var db = require('./server/dbConfig.js')
var port = process.env.PORT || 3000;
var url = process.env.URL || 'localhost';
var http = require('http');
var fs = require('fs');

app.listen(port, url);

console.log('Listening on', url, ':', port);


// var insertIntoDB = function(beerObj){
//   console.log('inside insertIntoDB()')
//   var params = {
//     //fix these properties
//     Name: beerObj.name,
//     IBU: beerObj.IBU,
//     ABV: beerObj.ABV,
//     Description: beerObj.description,
//     Imgurl: beerObj.imgUrl,
//     Location: beerObj.locaiton
//   }
//   db.query('CREATE (n:Beer {Name: ({Name}), IBU: ({IBU}), ABV: ({ABV}), Description: ({Description}), Imgurl: ({Imgurl}) })', params, function(err){
//     if(err){ console.log(err); } else {
//       console.log('successfully created beer node')
//     }
//   })
// }

// var beerNode = {
//   name: 'MikeBeer',
//   IBU: 800,
//   ABV: '.20',
//   Description: 'good beer',
//   Imgurl: 'undefined',
//   Location: 'America'
// }

// insertIntoDB(beerNode)

// db.query('CREATE (n:Beer)',null,function(){
//   console.log('yay');
// });

var beerget = function(path) {
  //deleted the url and key to push to github since it's a public repo.
  var beerDBurl = 'http://api.brewerydb.com/v2/'
  var key = '7cce543c5ae17da2dba68c674c198d2d'
  // var requestUrl = beerDBurl + path + '/?p='+page+'&key=' + key
  var requestUrl;
  var page;
  var counter = 0;

  for(var i=1;i<650;i++){
    (function(x){
      page = x;
      requestUrl = beerDBurl + path + '/?p='+page+'&key=' + key;
      http.get(requestUrl, function(res){
        var str = '';
        res.on('data', function (chunk) {
           str += chunk;
        });
        res.on('end', function () {
           counter++;
           console.log(counter)
           //Need to implement addToDatabase function
           //addToDatabase(JSON.parse(str))
           if(counter===650){
             console.log('final page');
           }
        });
      });
    })(i)
  }
      // console.log('heres your data: ',response);
};
      
beerget('/beers'); 
