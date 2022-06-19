var db = require('../../config/db');

// Router
module.exports = {
    // non active 
    findAll: function(req, res) {
        console.log("Find All Called Bloc");
        console.log(req.body);
        var sql = `SELECT BPMS.id_association, ASS.nom, PARC.code_parce, PARC.id_benef, PARC.ref_gps, PARC.lat, PARC.log, PARC.superficie, PARC.id_fkt, PARC.status 
                    FROM parcelle PARC
                    INNER JOIN beneficiaire B ON B.code_benef = PARC.id_benef
                    INNER JOIN benef_activ_pms BPMS ON BPMS.id_benef = B.code_benef
                    INNER JOIN association ASS ON ASS.code_ass = BPMS.id_association
                    INNER JOIN assoc_parce ASS_PRC ON (ASS_PRC.id_parce = PARC.code_parce AND ASS_PRC.id_assoc = ASS.code_ass)`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE BPMS.status = "active" AND PARC.status = "active" AND ASS_PRC.status = "active" AND BPMS.id_association = "${req.body.code_ass}"`;
        } else sql += ` WHERE BPMS.status = "active" AND PARC.status = "active" AND ASS_PRC.status = "active"`;
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From Projet:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    // active
    findParcelleAss: function(req, res) {
        console.log("Find All Called Bloc");
        console.log(req.body);
        var sql = `SELECT ASS_PARCE.code_parce, ASS_PARCE.id_assoc, ASS.nom AS nom_ass, ASS_PARCE.id_benef, BENF.nom AS nom_benef, 
                    ASS_PARCE.ref_gps, ASS_PARCE.lat, ASS_PARCE.log, ASS_PARCE.superficie, ASS_PARCE.id_fkt, ASS_PARCE.anne_adheran, ASS_PARCE.status
                    FROM assoc_parce ASS_PARCE 
                    INNER JOIN association ASS ON ASS.code_ass = ASS_PARCE.id_assoc
                    INNER JOIN beneficiaire BENF ON BENF.code_benef = ASS_PARCE.id_benef
                    INNER JOIN benef_activ_pms BPMS ON (BPMS.id_benef = BENF.code_benef AND BPMS.id_association = ASS_PARCE.id_assoc)`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE ASS_PARCE.status = "active" AND BENF.statut = "active" AND BPMS.status = "active" AND ASS_PARCE.id_assoc = "${req.body.code_ass}"`;
        } else sql += ` WHERE ASS_PARCE.status = "active" AND BENF.statut = "active" AND BPMS.status = "active"`;
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From assoc_parce:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findAllParceBenefBloc: function(req, res) {
        console.log("Find All Called Bloc Benef");
        console.log(req.body);
        var sql = `SELECT BBL.id_bloc, BL.nom AS nom_bloc, PARCE.code_parce, PARCE.id_benef, PARCE.ref_gps, PARCE.lat, PARCE.log, PARCE.superficie, PARCE.id_fkt, PARCE.status
                    FROM parcelle PARCE 
                    INNER JOIN beneficiaire B ON B.code_benef = PARCE.id_benef
                    INNER JOIN benef_activ_bl BBL ON BBL.id_benef = PARCE.id_benef
                    INNER JOIN bloc BL ON BL.code_bloc = BBL.id_bloc
                    INNER JOIN bloc_parce BPARCE ON (BPARCE.id_parce =  PARCE.code_parce AND BL.code_bloc = BPARCE.id_bloc)`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE BBL.status = "active" AND PARCE.status = "active" AND BPARCE.status = "active" AND BPARCE.id_bloc = "${req.body.id_bloc}"`;
        } else sql += ` WHERE BBL.status = "active" AND PARCE.status = "active" AND BPARCE.status = "active"`;
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From Projet:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    // Active
    findParcelleBloc: function(req, res) {
        console.log("Find All Called Bloc Parcelle");
        console.log(req.body);
        var sql = `SELECT BLOC_PARCE.code_parce, BLOC_PARCE.id_bloc, BL.nom AS nom_bloc, BLOC_PARCE.id_benef, BENF.nom AS nom_benef, BLOC_PARCE.ref_gps, BLOC_PARCE.lat, BLOC_PARCE.log, BLOC_PARCE.superficie, BLOC_PARCE.id_fkt, BLOC_PARCE.anne_adheran, BLOC_PARCE.status 
                    FROM bloc_parce BLOC_PARCE 
                    INNER JOIN bloc BL ON BL.code_bloc = BLOC_PARCE.id_bloc 
                    INNER JOIN beneficiaire BENF ON BENF.code_benef = BLOC_PARCE.id_benef 
                    INNER JOIN benef_activ_bl BBL ON (BBL.id_benef = BENF.code_benef AND BBL.id_bloc = BLOC_PARCE.id_bloc)`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += `WHERE BLOC_PARCE.status = "active" AND BENF.statut = "active" AND BBL.status = "active" AND BLOC_PARCE.id_bloc = "${req.body.id_bloc}"`;
        } else sql += ` WHERE BLOC_PARCE.status = "active" AND BENF.statut = "active" AND BBL.status = "active"`;
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From assoc_parce:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findParcellePRBloc: function(req, res) {
        var sql = `SELECT CEP.code_parce, CEP.id_bloc, CEP.id_benef, CEP.ref_gps, CEP.lat, CEP.log, CEP.superficie, CEP.id_commune, CEP.id_fkt, CEP.village, CEP.anne_adheran, CEP.etat, CEP.status 
                FROM cep_parce CEP
                INNER JOIN beneficiaire BNF ON BNF.code_benef = CEP.id_benef
                INNER JOIN benef_activ_pr BAPR ON BAPR.id_benef = BNF.code_benef`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            let code_pr = req.body.code_pr;
            let reponse = [];
            if (code_pr && code_pr.length > 0) {
                code_pr.forEach((elem_code_pr, ind) => {
                    sql_where = sql + ` WHERE CEP.etat = "valide" AND CEP.status = "active" AND BNF.statut = "active" AND BNF.etat = "valide" AND BAPR.status = "active" AND BAPR.etat = "valide" AND BAPR.code_pr = "${elem_code_pr}"`;
                    db.query(sql_where, (err, rows, fields) => {
                        if (err) {
                            return res.status(500).send({ error: 'From cep_parce:::::something failed ' + err});
                        }
                        reponse.push(rows);
                        console.log(":::::Import CEP Code_pr::", elem_code_pr);
                        //console.log(":::::Import CEP Reponse::", reponse);
                        if ((code_pr.length - 1) == ind) {
                            console.log("::::::Call Import parcelle PR Bloc:::::", req.body)
                            console.log(":::::Import CEP Reponse::", reponse);
                            return res.status(200).json(reponse);
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