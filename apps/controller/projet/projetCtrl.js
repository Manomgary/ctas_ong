var db = require('../../config/db');

// Router
module.exports = {
    findAll: function(req, res) {
        console.log("Find All Called");
        var sql = `SELECT numero, code_proj, nom, description, ancronyme, dt_deb_prev, dt_deb, dt_fin_prev, dt_fin, duree, logo, statuts 
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
        console.log("Find All Called findActiviteProjet::::::::findActiviteProjet:::::");
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
        console.log("Find All Called findActiviteProjet::::Projet findEquipeProjet::::");
        console.log(req.body)
        var sql = `SELECT PE.code, PE.id_projet, PE.id_equipe, PE.status_pe 
                FROM projet_equipe PE
                INNER JOIN equipe EQ ON EQ.code_equipe = PE.id_equipe AND EQ.statuts = "active"
                INNER JOIN projet PRJ ON PRJ.code_proj = PE.id_projet AND PRJ.statuts = "activer"`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            if (req.body.id_projet != undefined) { 
                console.log("::::id_projet:::: condition", req.body.id_projet);
                sql += ` WHERE PE.status_pe = "active" AND PE.id_projet = '${req.body.id_projet}'`;
            } else {
                console.log("::::Else id_projet condition :::: condition", req.body.id_projet);
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
    findEquipeProjetVolet: (req, res) => {
        var sql = `SELECT PEV.code, PEV.id_projet, PEV.id_equipe, PEV.id_volet, PEV.status_pev
        FROM projet_equipe_volet PEV
        INNER JOIN  projet_equipe PE ON PE.id_projet = PEV.id_projet AND PE.id_equipe = PEV.id_equipe AND  PE.status_pe = "active"
        INNER JOIN projet PRJ ON PRJ.code_proj = PEV.id_projet AND PRJ.statuts = "activer"
        INNER JOIN equipe EQ ON EQ.code_equipe = PEV.id_equipe AND EQ.statuts = "active"`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            if (req.body.id_projet != undefined && req.body.code_equipe != undefined) {
                sql += ` WHERE PEV.status_pev = "active"  AND PEV.id_projet =  "${req.body.id_projet}" AND PEV.id_equipe = ${req.body.code_equipe}`;
            }
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From projet_equipe:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findProjetVolet: function(req, res) {
        var  sql = `SELECT PV.code, PV.id_projet, PV.id_volet, PV.id_chef, PV.annee_integr, PV.statuts 
                    FROM participe_proj_volet PV`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE PV.statuts = 1 AND PV.id_projet = '${req.body.id_projet}'`;
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From participe_proj_volet:::::something failed ' + err});
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