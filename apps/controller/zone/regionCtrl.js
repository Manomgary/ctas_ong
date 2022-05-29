var db = require('../../config/db');

// Router
module.exports = {
    findAll: function(req, res) {
        console.log("Find All Called");
        var sql = `SELECT code_reg, nom_reg FROM zone_region`;

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From zone_region:::::something failed ' + err});
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