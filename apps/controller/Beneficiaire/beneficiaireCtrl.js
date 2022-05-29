var db = require('../../config/db');
// Routes
module.exports = {
    findAll: function(req, res) {
        console.log("Call BENEFICIAIRE");
        var sql = `SELECT B.code_benef, B.img_benef, B.nom, B.prenom, B.sexe, B.dt_nais, B.surnom, B.cin, B.dt_delivrance, B.lieu_delivrance, B.img_cin, B.contact, B.id_fkt, B.dt_Insert, B.statut FROM beneficiaire B`;
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From BENEFICIAIRE:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findPmsByProjet(req, res) {
        console.log("Call BENEFICIAIRE BY PROJET");
        var sql = `SELECT ASS.nom, BPMS.code_benef_pms, BPMS.id_proj, BPMS.id_benef, B.nom, BPMS.id_activ, BPMS.id_association, BPMS.id_collaborateur, BPMS.status as status_pms, 
                    B.code_benef, B.img_benef, B.nom, B.prenom, B.sexe, B.dt_nais, B.surnom, B.cin, B.dt_delivrance, B.lieu_delivrance, B.img_cin, B.contact, B.id_fkt, B.dt_Insert, B.statut 
                    FROM benef_activ_pms BPMS 
                    INNER JOIN beneficiaire B on B.code_benef = BPMS.id_benef 
                    INNER JOIN association ASS ON ASS.code_ass = BPMS.id_association 
                    INNER JOIN activite A on A.code_act = BPMS.id_activ INNER JOIN projet P ON P.code_proj = BPMS.id_proj INNER JOIN participe_proj_activ PA ON (PA.id_proj = P.code_proj AND PA.id_activ = A.code_act)`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += ` WHERE A.code_act = ${req.body.code_act} AND ASS.code_ass = "${req.body.code_ass}" AND PA.statuts = 'active' AND BPMS.status = 'active' AND P.code_proj = '${req.body.id_projet}'`;
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From benef_activ_pms:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findBenefBlocByProjet(req, res) {
        console.log("Call BENEFICIAIRE BLOC BY PROJET");
        var sql = `SELECT BAB.code_benef_bl, BAB.id_proj, BAB.id_activ, BAB.id_benef, BAB.id_bloc, BAB.id_collaborateur, BAB.status as status_benef_bloc,
                        B.code_benef, B.img_benef, B.nom, B.prenom, B.sexe, B.dt_nais, B.surnom, B.cin, B.dt_delivrance, B.lieu_delivrance, B.img_cin, B.contact, 
                        B.id_fkt, B.dt_Insert, B.statut as status_benef
                    FROM benef_activ_bl  BAB 
                    INNER JOIN projet P ON P.code_proj = BAB.id_proj
                    INNER JOIN activite A ON A.code_act = BAB.id_activ
                    INNER JOIN beneficiaire B ON B.code_benef = BAB.id_benef
                    INNER JOIN bloc BL ON BL.code_bloc = BAB.id_bloc
                    INNER JOIN collaborateur C ON C.code_col = BAB.id_collaborateur
                    INNER JOIN participe_proj_activ PA ON (PA.id_activ = BAB.id_activ AND PA.id_proj = BAB.id_proj)`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            console.log("+++++++++++++requete body non nulL::: BENEFICIAIRE BLOC +++++++++++++++++++");
            let bloc = req.body.bloc;
            let response = [];
            console.log(bloc);

            if (bloc && bloc.length > 0) {
                bloc.forEach((item, i) => {
                    sql_where = sql + ` WHERE BL.status = "active" AND BAB.status = "active" AND BAB.id_activ = ${item.code_act} AND BL.code_bloc =  "${item.id_bloc}" AND P.code_proj = '${item.id_projet}'`;
    
                    db.query(sql_where, (err, rows, fields) => {
                        if (err) {
                            return res.status(500).send({ error: 'From benef_activ_bl:::::something failed ' + err});
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
        } else console.log("Requete body null ou undefened");
    },
    add: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur insertion controller</h1>');
    },
    update: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur update controller</h1>');
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