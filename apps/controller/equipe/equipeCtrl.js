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
        console.log("Call activiter");
        var sql = `SELECT DISTINCT E.code_equipe, E.img,  E.matricule, E.nom, prenom, E.sexe, E.dt_nais, E.cin, E.dt_delivrance, E.lieu_delivrance, E.img_cin, E.email, E.num_perso, E.num_float, E.dt_deb_contrat, E.dt_fin_contrat, E.id_fonct, F.intitule AS intitule_fct, E.statuts 
                    FROM equipe E 
                    INNER JOIN fonction F ON F.code_fonct = E.id_fonct
                    INNER JOIN projet_equipe PE ON (PE.status_pe = "active" AND PE.id_equipe = E.code_equipe)`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            
            if (typeof req.body.id_projet != 'undefined') {
                sql += ` WHERE E.statuts = "active" AND PE.id_projet = '${req.body.id_projet}'`;
            } else sql += ` WHERE E.statuts = "active" AND E.code_equipe = ${req.body.code_equipe}`;
            console.log("requete body non null!!");
        } else sql += ` WHERE E.statuts = "active"`;

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From activite:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    removeById: function(req, res) {

    },
    removeAll: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur RemoveAll controller</h1>');
    }
}