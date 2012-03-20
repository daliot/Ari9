exports.mainFunc = function(req, res) 
{
  // 로그인 (아이디/패스워드 확인)
    var requestUrl = require('url').parse(req.url, true);

	var id = requestUrl.query['id']; 
	var passwd = requestUrl.query['passwd'];

	if(id == "admin" && passwd == "1234") {
		res.write("Welcome, Admin!\n");
	} else {
		res.write("No! \n");
	}

    res.end();

}