var db = require('../../config/db');

// Router
module.exports = {
    findAll: function(req, res) {
        console.log("Find All Called Association");
        console.log(req.body);
        var sql = `SELECT ASS.code_ass, ASS.nom, ASS.id_prjt, ASS.id_tech, ASS.id_pms, ASS.id_fkt, ASS.status 
                    FROM association ASS`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE ASS.code_ass  =  ${req.body.id_association}`;
        }

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From Association:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findAssocByProjet: function(req, res) {
        console.log("Find All Called findActiviteProjet");
        console.log(req.body);
        var sql = `SELECT ASS.numero, ASS.code_ass, ASS.nom as nom_ass, ASS.id_prjt, ASS.ancronyme, P.code_proj, P.nom as nom_pr, ASS.id_tech, E.code_equipe, concat(E.nom,' ',E.prenom) nom_famille, ASS.id_fkt, FKT.code_fkt, FKT.nom_fkt, C.code_com, C.nom_com, ASS.status 
                    FROM association ASS 
                    INNER JOIN projet P ON P.code_proj = ASS.id_prjt 
                    INNER JOIN equipe E ON E.code_equipe = ASS.id_tech 
                    INNER JOIN zone_fonkotany FKT ON FKT.code_fkt = ASS.id_fkt
                    INNER JOIN zone_commune C ON C.code_com = FKT.id_com`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE P.statuts = "activer" AND ASS.status = 'active' AND E.code_equipe = ${req.body.id_equipe} AND P.code_proj =  '${req.body.id_projet}'`;
        }

        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From association Projet:::::something failed ' + err});
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