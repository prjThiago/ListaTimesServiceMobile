var mysql = require('mysql');

function createDBConnection() {	
	
	if(process.env.NODE_ENV == "production") {
		
		var connection = process.env.CLEARDB_DATABASE_URL;
		
		var conn = connection.match(/mysql:\/\/(.*):(.*)@(.*)\/(.*)\?reconnect=true/);
		
		return mysql.createConnection({
				host: conn[3],
				user: conn[1],
				password: conn[2],
				database: conn[4]
		});	
	} else{
		return mysql.createConnection({
				host: 'localhost',
				user: 'root',
				password: '',
				database: 'listatimesmobile'
		});		
	}
	
};

//wrapper
module.exports = function(){
	return createDBConnection;
};