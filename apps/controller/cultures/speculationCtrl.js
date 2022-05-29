var db = require('../../config/db');

// Router
module.exports = {
    findAllCategEspece: function(req, res) {
        console.log("District All Called");
        //console.log(req);
        var sql = `SELECT code_cat, libelle FROM categorie_espece`;

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From categorie_espece:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findAllEspece: function(req, res) {
        console.log("District All Called");
        //console.log(req);
        var sql = `SELECT code_espece, nom_espece, id_categ FROM espece`;

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From espece:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findAllVariette: function(req, res) {
        console.log("District All Called");
        //console.log(req);
        var sql = `SELECT code_var, nom_var, id_espece FROM variette`;

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From variette:::::something failed ' + err});
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