///////////////////////////////////////////////
// All middleware installation and router
// injection happens here
//////////////////////////////////////////////
var bodyParser = require('body-parser');

module.exports = function(app,express){
	// Inject all middleware dependencies that will
	// be used in all routes
	app.use(bodyParser.json());
	app.use(bodyParser.urlencoded({extended: true}));
	// app.use(express.static(__dirname + '/../../client'));


}