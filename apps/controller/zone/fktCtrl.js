var db = require('../../config/db');

// Router
module.exports = {
    findAll: function(req, res) {
        console.log("District All Called");
        //console.log(req);
        var sql = `SELECT D.id_reg, R.nom_reg, C.id_dist, D.nom_dist, F.id_com, C.nom_com, F.code_fkt, F.nom_fkt 
                    FROM zone_fonkotany F 
                    INNER JOIN zone_commune C ON C.code_com = F.id_com 
                    INNER JOIN zone_district D ON D.code_dist = C.id_dist
                    INNER JOIN zone_region R ON R.code_reg = D.id_reg`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE C.code_com = ${req.body.id_com} ORDER BY R.nom_reg, D.nom_dist, C.nom_com, F.nom_fkt`;
        } else sql += ` ORDER BY R.nom_reg, D.nom_dist, C.nom_com, F.nom_fkt`;

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