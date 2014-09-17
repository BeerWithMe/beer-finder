// var neo4j = require('neo4j');
// var db = new neo4j.GraphDatabase(); //in there will be a long url that connects us to our database.



module.exports = function(app) {
  //in addition to the tests set up below, we can later put calls to db here.
  
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
};