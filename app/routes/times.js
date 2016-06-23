module.exports = function(app) {

    app.get('/times', function(req, res){

        var connection = app.infra.connectionFactory();
        
        var timesList = new app.infra.TimesDAO(connection);

        timesList.lista(function(err, resposta) {
            
            console.log(err);
            
            res.format({
                json: function() {
                    res.json(resposta);
                }
            });
            
        });

        connection.end();

    });

    app.get('/times/listaPorDivisao/:divisao', function(req, res){
       
        var connection = app.infra.connectionFactory(),
            timesList = new app.infra.TimesDAO(connection);

        timesList.listaPorDivisao(req.params.divisao, function(err, resposta) {
            res.format({
                json: function() {
                    res.json(resposta);
                }
            });
            
        });

        connection.end();
    });    
}