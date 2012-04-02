var originalSession = {"sessid":0, "timestamp":1, "id":2};
var sessionList = [];

sessionList.push(originalSession);
sessionList.push(originalSession);
sessionList.push(originalSession);
sessionList.push(originalSession);


exports.exists = function(sessionId) 
{
	var result = false;
	sessionList.forEach(function(eachSession){
		if(result == false && eachSession.sessid == sessionId){
			result = true;
		}
	});
	return result;
}

exports.add = function(userId) 
{
	sessionList.push(originalSession);
}

exports.list = function()
{
	console.log(sessionList);
}

exports.empty = function()
{
	sessionList = [];
}