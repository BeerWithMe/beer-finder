var neo4j = require('neo4j');
var db = new neo4j.GraphDatabase('http://goldenlions.cloudapp.net:7474');

module.exports = db