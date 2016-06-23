var mysql = require('mysql');

function createDBConnection() {
	
	//if(process.env.NODE_ENV == "production") {
		return mysql.createConnection({
				host: '108.179.193.89',
				user: 'torce428_listati',
				password: '123qwe$%fpde10{}',
				database: 'torce428_listatimes'
		});	
	/*} else{
		return mysql.createConnection({
				host: 'localhost',
				user: 'root',
				password: '',
				database: 'listatimesmobile'
		});		
	}*/
	
};

//wrapper
module.exports = function(){
	return createDBConnection;
};