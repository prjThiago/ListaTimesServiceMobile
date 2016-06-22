function TimesDAO(connection){
	this._connection = connection;
}

TimesDAO.prototype.lista = function(callback){

	this._connection.query('select * from times', callback);

};

TimesDAO.prototype.listaPorDivisao = function(divisao, callback) {
    this._connection.query('select * from times where id_divisao = ' + divisao + 'order by nome', callback);  
};

TimesDAO.prototype.listaTimeeSedes = function(id_time, callback){
    this._connection.query('select * from sedes where sedes.id_time = ' + id_time, callback);  
};

module.exports = function(){
	return TimesDAO;
}