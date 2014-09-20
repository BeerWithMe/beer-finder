var db = require('./dbConfig.js')

module.exports = function(app) {

  // Define which routers are assigned to each route.
  app.get('/', function (req, res) {
    console.log('request received');
    res.send('<html><body><h1>Hello World</h1></body></html>');
    // console.log('response: ',res)
    // res.end('<html><body><h1>Hello World</h1></body></html>');
  });

  app.get('/questionnaire', function (req, res) {
    var testResponse = { results: [{'id': 41220, 'name': 'Budweiser', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/1P45iR/upload_upBR4q-large.png'},
    {'id': 58978, 'name': 'Racer 5 IPA', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/o1OELJ/upload_OutGJZ-large.png'},
    {'id': 37259, 'name': 'Anchor Steam' , 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/Uiol9p/upload_drOw0u-large.png'},
    {'id': 47942, 'name': 'Guinness Draught', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/StkEiv/upload_etArOb-large.png'},
    {'id': 40135, 'name': 'Blue Moon Belgian White' , 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/dDXOEp/upload_SZEtGz-large.png'}]};
    res.send(testResponse);
  });
};