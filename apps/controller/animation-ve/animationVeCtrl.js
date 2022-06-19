var db = require('../../config/db');

// Router
module.exports = {
    findAnimationPr: function(req, res) {
        console.log(req.body)
        var sql = `SELECT VE.code, VE.id_pr, VE.id_fkt, VE.id_commune, VE.village, VE.date_anim, VE.nb_participant, VE.nb_h, VE.nb_f, VE.nb_inf_25, VE.type, VE.img_piece, VE.img_group_particip, VE.id_tech_recenseur, VE.etat, VE.status 
                FROM animation_ve VE
                INNER JOIN benef_activ_pr BAPR ON BAPR.code_pr = VE.id_pr AND BAPR.etat = "valide" AND BAPR.status = "active"
                INNER JOIN beneficiaire BNF ON BNF.code_benef = BAPR.id_benef AND BNF.statut = "active" AND BNF.etat = "valide"
                INNER JOIN equipe EQ ON EQ.code_equipe = BAPR.id_tech AND EQ.statuts = "active"
                INNER JOIN projet PRJ ON PRJ.code_proj = BAPR.id_proj AND PRJ.statuts = "activer"`;

        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {  
            if (req.body.id_projet != undefined && req.body.id_equipe !=  undefined) {
                sql += ` WHERE VE.etat = "valide" AND VE.status = "active" AND PRJ.code_proj = "${req.body.id_projet}" AND EQ.code_equipe = ${req.body.id_equipe}`;
            } 
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From animation_ve:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findSpeculationPr: function(req, res) {
        var sql = `SELECT VE_SPEC.code_specu, VE_SPEC.id_anime_ve, VE_SPEC.id_var, VE_SPEC.id_espece, VE_SPEC.quantite, VE_SPEC.etat, VE_SPEC.status 
                FROM animation_ve_specu VE_SPEC
                INNER JOIN animation_ve VE ON VE.code = VE_SPEC.id_anime_ve AND VE.etat = "valide" AND VE.status = "active"`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            if (req.body.code_animation != undefined) {
                let code_animation =  req.body.code_animation;
                let reponse = [];
                if (code_animation.length > 0) {
                    code_animation.forEach((item, ind) => {
                        sql_where = sql + ` WHERE VE.etat = "valide" AND VE.status = "active" AND VE_SPEC.id_anime_ve = "${item}"`;
                        db.query(sql_where, (err, rows, fields) => {
                            if (err) {
                                return res.status(500).send({ error: 'From animation_ve_specu:::::something failed ' + err});
                            }
                            reponse.push(rows);
                            if ((code_animation.length - 1) === ind) {
                                return res.status(200).json(reponse);
                            }
                        });
                    });
                }
            }
        }
    }
}