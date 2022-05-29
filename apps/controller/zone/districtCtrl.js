var db = require('../../config/db');

// Router
module.exports = {
    findAll: function(req, res) {
        console.log("District All Called");
        //console.log(req);
        var sql = `SELECT R.code_reg, R.nom_reg, D.code_dist, D.nom_dist, D.id_reg
                    FROM zone_district D INNER JOIN zone_region R ON R.code_reg = D.id_reg`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE D.id_reg = ${req.body.id_reg} ORDER BY R.nom_reg, D.nom_dist`;
        } else sql += ` ORDER BY R.nom_reg, D.nom_dist`;

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From zone_district:::::something failed ' + err});
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