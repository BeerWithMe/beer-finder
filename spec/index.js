var path = require('path');
var request = require('request');
var expect = require('chai').expect;
var http = require('http');
var index = require(path.join(__dirname, '/../index.js'));

describe('index.js', function () {
  'use strict';
  it('should answer GET requests for "/"', function (done) {
    request.get("http://localhost:3000/",function(error,response,body){
      console.log(response.body);
      expect(response.body).to.equal('<html><body><h1>Hello World</h1></body></html>')
      done();
    });
  });


  it('does something', function () {
    expect(true).to.equal(false);
  });

  xit('does something else', function () {
    expect(true).to.equal(false);
  });

  // Add more assertions here
});
