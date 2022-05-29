var db = require('../../config/db');

// Router
module.exports = {
    // non active 
    findAll: function(req, res) {
        console.log("Find All Called Bloc");
        console.log(req.body);
        var sql = `SELECT code_saison, intitule, description FROM saison`;

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From Projet:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    insert: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur Add new controller Projet</h1>');
    },
    update: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur update controller Projet</h1>');
    },
    delete: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur deleteAll controller Projet</h1>');
    }
}