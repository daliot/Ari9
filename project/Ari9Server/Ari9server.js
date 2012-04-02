var myModule = require('./login.js');
var getVersionModule = require('./getVersion.js');
var gameDataModule = require('./getGameData.js');


var dispatchDictionary = {
	"/login/" : myModule,
	"/getUpdateVersion" : getVersionModule,
	"/getGameData" : gameDataModule
};


var http = require('http');


http.createServer(function (req, res) {

  res.writeHead(200, {'Content-Type': 'text/plain'});

  var requestUrl = require('url').parse(req.url, true);
  var method = requestUrl.pathname;

  if(req.url === '/favicon.ico') {
    res.end();
    return;
  }
  
  var selMo = dispatchDictionary[method];
  if(selMo==null){
     res.write("unknown api: \""+req.url+"\"");
     res.end();
     return;
  }
  selMo.mainFunc(req,res);

}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');
