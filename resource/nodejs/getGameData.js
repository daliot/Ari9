var fs = require('fs');

exports.gameDataFunc = function(res) 
{
    //res.write("<JSON DATA>");
    console.log("getGameData");
    fs.readFile('gamedata.json', 'UTF-8', function (err, data) {
      console.log(data);
      
      if (err) throw err;
      res.write(data + "\n");
    
      res.end();
    });
}