// Imports
var express = require('express');
var bodyParser = require('body-parser');
var apiRouter = require('./apiRouter').router;
var cors = require('cors');

//Instiate server
var server = express();

// New - Add CORS headers - see https://enable-cors.org/server_expressjs.html
server.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept"
    );
    next();
  })

// configure cors
server.use(cors());

//body parser configure
server.use(bodyParser.urlencoded({ limit: '50mb', extended : true }));
server.use(bodyParser.json({limit: '50mb'}));

//configure route
server.get('/', function (req, res) {
    res.setHeader('Content-Type', 'text/html');
    res.status(200).send('<h1> Bienvenu sur le serveur ctas</h1>');
});

server.use('/api/', apiRouter);


// set port, listen for requests
const PORT = process.env.PORT || 8080

//launch server
server.listen(PORT, function() {
    console.log('serveur en ecoute sur le port:::::' + PORT);
});