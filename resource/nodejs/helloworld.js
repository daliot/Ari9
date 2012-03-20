var myModule = require('./login.js');
var getVersionModule = require('./getVersion.js');
var gameDataModule = require('./getGameData.js');

var http = require('http');


http.createServer(function (req, res) {

  res.writeHead(200, {'Content-Type': 'text/plain'});

  var requestUrl = require('url').parse(req.url, true);
  var method = requestUrl.pathname;

  if(req.url === '/favicon.ico') {
    res.end();
    return;
  }

  // 로그인 (아이디/패스워드 확인)
  if(method === "/login/") {
  	  myModule.loginFunc(res, requestUrl);
	  return;
  }

  // 게임 데이터 최신 버전 확인 하기
  if(method == "/getUpdateVersion") {
		getVersionModule.versionFunc(res);
		return;
  } 

  // 최신 게임 데이터 가져오기
  if(method == "/getGameData") {
	  gameDataModule.gameDataFunc(res);
	  return;
  }

   res.write("unknown api: \""+req.url+"\"");
   res.end();


}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');
