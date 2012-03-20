exports.loginFunc = function(res, _url) 
{
  // 로그인 (아이디/패스워드 확인)
	var id = _url.query['id']; 
	var passwd = _url.query['passwd'];

	if(id == "admin" && passwd == "1234") {
		res.write("Welcome, Admin!\n");
	} else {
		res.write("No! \n");
	}

    res.end();

}