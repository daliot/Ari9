var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('ari9.db');

var sessMod = require('./session.js');

exports.mainFunc = function(req, res) 
{
	//console.log(sessMod.exists(0));
	sessMod.list();
	sessMod.add("cholsu");
	sessMod.list();
	sessMod.empty();
	sessMod.list();
	res.end();
	return;


    var requestUrl = require('url').parse(req.url, true);

	var id = requestUrl.query['id']; 
	var passwd = requestUrl.query['passwd'];

	   // 로그인 (아이디/패스워드 확인)
	 //db.all("SELECT count(*) from user where id = ? and pwd = ?", id, passwd, function(err, rows) {
	 db.all("select count(*) as cnt from user where id = '" + id + "' and pwd = '" + passwd + "'", function(err, rows) {

	 	rows.forEach(function(row) {
	 		if(row.cnt > 0) {
	 			res.write("Welcome, " + id + "!\n");
	 		} else {
		 		res.write("No! \n");
	 		}
	// 		console.log(row.cnt);
	 		
	 	});
		res.end();
	 	//db.close();
	 });

}