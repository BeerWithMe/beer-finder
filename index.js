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

//
var insertIntoDB = function(beerObj){
  console.log('inside insertIntoDB()')
  if(beerObj.labels){
    var pic = beerObj.labels.large;
  }
  var params = {
    //fix these properties
    Name: beerObj.name,
    IBU: beerObj.ibu || 'undefined',
    ABV: beerObj.abv || 'undefined',
    Description: beerObj.description || 'undefined',
    Imgurl: pic||'http://darrylscouch.com/wp-content/uploads/2013/05/Mystery_Beer.png',
  }
  db.query('CREATE (n:Beer {Name: ({Name}), IBU: ({IBU}), ABV: ({ABV}), Description: ({Description}), Imgurl: ({Imgurl}) })', params, function(err){
    if(err){ console.log(err); } else {
      console.log('successfully created beer node')
    }
  })
}


// { id: 'SqP18Z',
//        name: '(512) Cascabel Cream Stout',
//        description: 'Our cream stout, is an indulgent beer brewed with generous amounts of  English chocolate and roasted malts, as well as the traditional addition of lactose. Our stout, however, parted ways with tradition when we added over 20 pounds of Cascabel peppers to the beer.  Cascabel peppers, also called Guajillo, are characterized by their earthy character and deep, smooth spiciness. The peppers were de-stemmed by hand and added to the beer post-fermentation to achieve their most potent flavor potential. They add hints of raisins and berries to the beer, as well as a subtle tingling spiciness that washes away with each gulp.',
//        abv: '6',
//        glasswareId: 5,
//        availableId: 4,
//        styleId: 20,
//        isOrganic: 'N',
//        labels: [Object],
//        status: 'verified',
//        statusDisplay: 'Verified',
//        createDate: '2012-01-03 02:42:36',
//        updateDate: '2012-03-22 13:05:12',
//        glass: [Object],
//        available: [Object],
//        style: [Object] 
// },
//      { id: 'ezGh5N',
//        name: '(512) IPA',
//        description: '(512) India Pale Ale is a big, aggressively dry-hopped American IPA with smooth bitterness (~65 IBU) balanced by medium maltiness. Organic 2-row malted barley, loads of hops, and great Austin water create an ale with apricot and vanilla aromatics that lure you in for more.',
//        abv: '7.2',
//        ibu: '65',
//        glasswareId: 5,
//        availableId: 1,
//        styleId: 30,
//        isOrganic: 'N',
//        labels: [Object],
//        status: 'verified',
//        statusDisplay: 'Verified',
//        createDate: '2012-01-03 02:42:36',
//        updateDate: '2013-10-08 11:11:49',
//        glass: [Object],
//        available: [Object],
//        style: [Object] 
// },

var beerget = function(path) {
  //deleted the url and key to push to github since it's a public repo.
  var beerDBurl = 'http://api.brewerydb.com/v2/'
  var key = '7cce543c5ae17da2dba68c674c198d2d'
  // var requestUrl = beerDBurl + path + '/?p='+page+'&key=' + key
  var requestUrl;
  var page;
  var counter = 0;

  for(var i=1;i<50;i++){
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
           console.log(JSON.parse(str))
           var beers = JSON.parse(str).data
           for(var k=0;k<beers.length;k++){
            insertIntoDB(beers[k]);
           }
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
