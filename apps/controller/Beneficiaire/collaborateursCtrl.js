var db = require('../../config/db');
// Routes
module.exports = {
    add: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur insertion controller</h1>');
    },
    update: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur update controller</h1>');
    },
    findAll: function(req, res) {
        console.log("Call Collaborateur");
        var sql = `SELECT code_col, nom, description FROM collaborateur`;
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From Collaborateur:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findById: function(req, res) {

    },
    removeById: function(req, res) {

    },
    removeAll: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur RemoveAll controller</h1>');
    }
}