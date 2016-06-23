var app = require('./config/express')();

var porta = process.env.PORT || 3000;
var mode = process.env.NODE_ENV || "Teste";

app.listen(porta, function(){
	console.log("Servidor rodando em modo "+ mode); 
});