var http = require('http');
var fs = require('fs');


http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});

  var _url = require('url').parse(req.url, true);
  var method = _url.pathname;

  console.log(method);


  if(req.url === '/favicon.ico') {
    res.end();
    return;
  }

  // 로그인 (아이디/패스워드 확인)
  if(method === "/login/" && _url != null) {

	var id = _url.query['id']; 
	var passwd = _url.query['passwd'];

	if(id == "admin" && passwd == "1234") {
		res.write("Welcome, Admin!\n");
	} else {
		res.write("No! \n");
	}

    res.end();

  }

  // 게임 데이터 최신 버전 확인 하기
  if(method == "/getUpdateVersion") {

     // TODO 최신 버전 가져오기
     res.write("20120313"); 
     res.end();


  } 

  // 최신 게임 데이터 가져오기
  if(method == "/getGameData") {
    //res.write("<JSON DATA>");
    console.log("getGameData");
    fs.readFile('gamedata.json', 'UTF-8', function (err, data) {
      console.log(data);
      
      if (err) throw err;
      res.write(data + "\n");
    
      res.end();
    });

  }


}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');
