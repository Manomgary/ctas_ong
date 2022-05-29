var db = require('../config/db');

// Router
module.exports = {
    login: function(req, res) {
        console.log("call login====");
        var reqSql = `SELECT U.code_util, U.id_equipe, E.code_equipe, E.img, E.nom, E.prenom, E.sexe,  DATE_FORMAT(E.dt_nais, "%Y-%m-%d") AS dt_nais, E.num_perso, E.id_fonct, F.intitule AS fonction, U.type, U.role, U.nom_users, U.mot_passe, U.situation AS situation_compte, E.statuts AS statuts_equipe, U.statuts AS statuts_compte 
                        FROM (
                            (utilisateurs U INNER JOIN equipe E ON E.code_equipe = u.id_equipe)
                            INNER JOIN fonction F ON F.code_fonct = E.id_fonct) 
                        WHERE E.num_perso = ${req.body.userName} AND E.statuts = "active" AND U.situation = "active"`;
        db.query(reqSql, (err, rows, fields) => {
            console.log(rows);
            if (err) {
                return res.status(500).send({ error: 'From Utilisateurs:::::something failed ' + err});
            }
            if (typeof   rows != 'undefined' && rows != null && rows.length > 0) {

                var reqSqls = `SELECT U.code_util, U.id_equipe, E.code_equipe, E.img, E.nom, E.prenom, E.sexe,  DATE_FORMAT(E.dt_nais, "%Y-%m-%d") AS dt_nais, E.num_perso, E.id_fonct, F.intitule AS fonction, U.type, U.role, U.nom_users, U.mot_passe, U.situation AS situation_compte, E.statuts AS statuts_equipe, U.statuts AS statuts_compte 
                                FROM (
                                    (utilisateurs U INNER JOIN equipe E ON E.code_equipe = u.id_equipe)
                                    INNER JOIN fonction F ON F.code_fonct = E.id_fonct)
                                WHERE E.num_perso = '${req.body.userName}' AND U.mot_passe = '${req.body.passWord}' AND E.statuts = "active" AND U.situation = "active"`;
                db.query(reqSqls, (err1, rows1, fields) => {
                    console.log(rows1);
                    if (err1) {
                        return res.status(500).send({ error: 'From Utilisateurs:::::something failed ' + err});
                    }
                    if (typeof   rows1 != 'undefined' && rows1 != null && rows1.length > 0) {
                        return res.json({
                            "status": 200,
                            "erreur": false,
                            "data": rows1});
                    } else {
                        return res.json({
                            "status": 2,
                            "message": "votre mot de passe est incorrecte!",
                            "data": rows1});  
                    }

                })
            } else {
                    console.log("votre identifiant n'existe pas!");
                    return res.json({
                        "status": 1,
                        "message": "votre identifiant n'existe pas!",
                        "data": rows});
            }
        })
    },
    findAll: function(req, res) {
        console.log(req.body);
        var sql = `SELECT code_util, id_equipe, type, role, nom_users, mot_passe, situation, statuts FROM utilisateurs`;

        // Teste empty Object
        if (Object.keys(req.body).length === 0 && req.body.constructor === Object) {
            console.log("Empty Onject!");
            db.query(sql, (err, rows, fields) => {
                if (err) {
                    return res.status(500).send({ error: 'From Utilisateurs:::::something failed ' + err});
                }
                return res.status(200).json(rows);
            })
        } else {
            console.log("Is not Empty Object");
            console.log(req.body);
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