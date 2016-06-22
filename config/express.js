var express = require("express");
var load = require('express-load');
var bodyParser = require('body-parser');
var helmet = require('helmet');

module.exports = function() {

	var app = express();
    
	app.use(bodyParser.urlencoded({ extended: true }));
	app.use(bodyParser.json());
    app.use(helmet());
    
    /*SEGURANÇA*/
    app.disable('x-powered-by');
    
    app.use(helmet.contentSecurityPolicy({
        // Specify directives as normal. 
        directives: {
            defaultSrc: ["'self'", 'default.com'],
            scriptSrc: ["'self'", "'unsafe-inline'"],
            styleSrc: ['style.com'],
            imgSrc: ['img.com', 'data:'],
            sandbox: ['allow-forms', 'allow-scripts'],
            reportUri: '/report-violation',
            objectSrc: [] // An empty array allows nothing through 
        },
        
        // Set to true if you only want browsers to report errors, not block them 
        reportOnly: false,
        
        // Set to true if you want to blindly set all headers: Content-Security-Policy, 
        // X-WebKit-CSP, and X-Content-Security-Policy. 
        setAllHeaders: false,
        
        // Set to true if you want to disable CSP on Android where it can be buggy. 
        disableAndroid: false,
        
        // Set to false if you want to completely disable any user-agent sniffing. 
        // This may make the headers less compatible but it will be much faster. 
        // This defaults to `true`. 
        browserSniff: true
    }));
        
    app.use(helmet.xssFilter())
    
	load('routes', {cwd: 'app'})
		.then('infra')
		.into(app);

	return app;
}