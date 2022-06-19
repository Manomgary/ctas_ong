var db = require('../../config/db');

// Router
module.exports = {
    findAll: function(req, res) {
        console.log("Find All Called Bloc");
        console.log(req.body);
        var sql = `SELECT code_bloc, nom, id_prjt, status FROM bloc`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE code_bloc = ${req.body.id_bloc}`;
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From Projet:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findBlocByProjet: function(req, res) {
        console.log("Find All Called findBlocByProjet");
        console.log(req.body);
        var sql = `SELECT B.ordre, B.code_bloc, B.nom as nom_bloc, B.ancronyme, B.id_prjt, P.code_proj, P.nom as nom_projet, B.id_tech, E.nom, B.status
                    FROM bloc B
                    INNER JOIN projet P ON P.code_proj = B.id_prjt
                    INNER JOIN equipe E ON E.code_equipe = B.id_tech
                    WHERE P.statuts = "activer" AND B.status = 'active' AND B.id_tech = ${req.body.id_equipe} AND P.code_proj = '${req.body.id_projet}'`;
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From bloc Projet:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findBlocZone: function(req, res) {
        console.log("Find All Called findBlocZone");
        console.log(req.body);
        var sql = `SELECT BZ.code, BZ.id_fkt, Fkt.code_fkt, Fkt.nom_fkt, BZ.id_bloc, B.code_bloc, B.nom, BZ.id_km 
                    FROM bloc_zone BZ 
                    INNER JOIN zone_fonkotany Fkt ON Fkt.code_fkt = BZ.id_fkt 
                    INNER JOIN bloc B ON B.code_bloc = BZ.id_bloc`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            console.log("requete body non null!!");
            let bloc = req.body.bloc;
            let response = [];
            console.log(bloc);

            if (bloc && bloc.length > 0) {
                bloc.forEach((item, i) => {
                    sql_where = sql + ` WHERE B.status = 'active' AND B.code_bloc = "${item.id_bloc}"`;
    
                    db.query(sql_where, (err, rows, fields) => {
                        if (err) {
                            return res.status(500).send({ error: 'From bloc_zone:::::something failed ' + err});
                        }
                        response.push(rows);
                        console.log(item);
                        console.log(response);
                        console.log(i);
                        console.log(bloc.length);
                        if ( (i + 1) == bloc.length) {
                            console.log(response);
                            return res.status(200).json(response);
                        }
                    });
                });
            }
        }
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