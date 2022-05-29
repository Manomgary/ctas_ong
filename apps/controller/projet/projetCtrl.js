var db = require('../../config/db');

// Router
module.exports = {
    findAll: function(req, res) {
        console.log("Find All Called");
        var sql = `SELECT numero, code_proj, nom, description, dt_deb_prev, dt_deb, dt_fin_prev, dt_fin, duree, logo, statuts 
                    FROM projet`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE statuts = "activer" AND code_proj = '${req.body.id_projet}'`;
        } else {
            sql += ` WHERE statuts = "activer"`;
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From Projet:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findActiviteProjet: function(req, res) {
        console.log("Find All Called findActiviteProjet");
        console.log(req.body)
        var sql = `SELECT  AP.code, AP.id_proj, P.nom, AP.id_activ, A.code_act, A.intitule, A.description, AP.statuts 
                    FROM  participe_proj_activ AP 
                    INNER JOIN activite A ON A.code_act = AP.id_activ
                    INNER JOIN projet P ON P.code_proj = AP.id_proj`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE P.code_proj = '${req.body.id_projet}'`;
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From Projet:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findEquipeProjet: function(req, res) {
        console.log("Find All Called findActiviteProjet");
        console.log(req.body)
        var sql = `SELECT PE.code, PE.id_projet, PE.id_equipe, PE.id_volet, PE.status_pe 
                    FROM projet_equipe PE`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            if (typeof req.body.id_projet != 'undefined') {
                sql += ` WHERE PE.status_pe = "active" AND PE.id_projet = '${req.body.id_projet}'`;
            } else {
                sql += ` WHERE PE.status_pe = "active" AND PE.id_equipe = ${req.body.code_equipe}`;
            }
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From projet_equipe:::::something failed ' + err});
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