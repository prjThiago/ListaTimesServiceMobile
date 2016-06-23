var mysql = require('mysql');

function createDBConnection() {	
	
	if(process.env.NODE_ENV == "production") {
		
		var connection = process.env.CLEARDB_DATABASE_URL;
		
		var conn = connection.match(/mysql:\/\/(.*):(.*)@(.*)\/(.*)?reconnect=true/);
		
		console.log(conn);
		
		return mysql.createConnection({
				host: conn[2],
				user: conn[0],
				password: conn[1],
				database: conn[3]
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