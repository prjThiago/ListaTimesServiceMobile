var mysql = require('mysql');

function createDBConnection() {
	return mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'listatimesmobile'
	});

};

//wrapper
module.exports = function(){
	return createDBConnection;
};