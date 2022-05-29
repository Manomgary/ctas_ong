var db = require('../../config/db');

// Router
module.exports = {
    /**
     * "WEB REQUEST" Find Mep Bloc 
     */
    findMepBlocWb: function(req, res) {
        console.log("District All Called");
        //console.log(req);
        var state = `SELECT PRJ.code_proj, PRJ.nom AS projet, BL.code_bloc, BL.nom AS bloc, CBL.code_culture, CBL.id_parce, BPRC.superficie AS sfce_reel, BABL.code_benef_bl, BNF.nom, BNF.prenom, CBL.id_espece, CBL.id_var, CBL.id_saison, SS.intitule AS saison, CBL.annee_du,  LEFT(CBL.ddp, 10) AS ddp, CBL.qso, LEFT(CBL.dds, 10) AS dds, CBL.sfce, CBL.sc, CBL.ea_autres, CBL.ea_id_variette, CBL.dt_creation, CBL.dt_modification, CBL.status, CBL.etat, CBL.id_equipe, CBL.type, 
        CASE WHEN CBL.id_espece IS NOT NULL THEN (SELECT ESP.nom_espece FROM espece ESP WHERE ESP.code_espece = CBL.id_espece) ELSE ''  END AS espece,
        CASE WHEN CBL.id_var IS NOT NULL THEN (SELECT CONCAT(ESP.nom_espece, ' ', V.nom_var) FROM variette V INNER JOIN espece ESP ON ESP.code_espece = V.id_espece WHERE V.code_var = CBL.id_var) ELSE '' END AS variette,
        CASE WHEN CBL.ea_id_variette IS NOT NULL THEN (SELECT CONCAT(ESP.nom_espece, ' ', V.nom_var) FROM variette V INNER JOIN espece ESP ON ESP.code_espece = V.id_espece WHERE V.code_var = CBL.ea_id_variette) 
        WHEN CBL.ea_autres IS NOT NULL THEN CBL.ea_autres ELSE '' END AS ea
        FROM culture_bl CBL
        INNER JOIN bloc_parce BPRC ON BPRC.code_parce = CBL.id_parce
        INNER JOIN bloc BL ON BL.code_bloc = BPRC.id_bloc
        INNER JOIN projet PRJ ON PRJ.code_proj = BL.id_prjt 
        INNER JOIN saison SS ON SS.code_saison = CBL.id_saison
        INNER JOIN beneficiaire BNF ON BNF.code_benef = BPRC.id_benef
        INNER JOIN benef_activ_bl BABL ON BABL.id_benef = BNF.code_benef
        WHERE CBL.status IN("EC") AND BPRC.status = "active" AND BL.status = "active" AND PRJ.statuts = "activer" AND BNF.statut = "active" AND BABL.status = "active"`;

        if (req.body.code_proj != undefined) {
            state += ` AND PRJ.code_proj = "${req.body.code_proj}"`;
        }
        db.query(state, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From cultures_BLOC:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findSuiviBlocWb: function(req, res) {
        console.log("District All Called");
        //console.log(req);
        var state = `SELECT PRJ.code_proj, PRJ.nom AS projet, BL.code_bloc, BL.nom AS bloc, CBL.id_saison, SS.intitule AS saison, BABL.code_benef_bl, BNF.nom, BNF.prenom, CBL.sc, CBL.etat AS etat_mep, CBL.annee_du, CBL.qso, LEFT(CBL.dds, 10) AS dds, CBL.sfce AS sfce_emblavee,  SVBL.code_sv, SVBL.id_culture, BPRC.code_parce, BPRC.superficie AS sfce_reel, LEFT(SVBL.ddp, 10) AS ddp, SVBL.stc, SVBL.ql, SVBL.qr, SVBL.long_ligne, SVBL.nbre_ligne, SVBL.nbre_pied, SVBL.img_cult, SVBL.ex, SVBL.etat AS etat_sv, CBL.type, CBL.id_espece,
        CASE WHEN CBL.id_espece IS NOT NULL THEN (SELECT ESP.nom_espece FROM espece ESP WHERE ESP.code_espece = CBL.id_espece) ELSE ''  END AS espece,
        CASE WHEN CBL.id_var IS NOT NULL THEN (SELECT CONCAT(ESP.nom_espece, ' ', V.nom_var) FROM variette V INNER JOIN espece ESP ON ESP.code_espece = V.id_espece WHERE V.code_var = CBL.id_var) ELSE '' END AS variette
        FROM suivi_bl SVBL
        INNER JOIN culture_bl CBL ON CBL.code_culture = SVBL.id_culture
        INNER JOIN bloc_parce BPRC ON BPRC.code_parce = CBL.id_parce
        INNER JOIN bloc BL ON BL.code_bloc = BPRC.id_bloc
        INNER JOIN projet PRJ ON PRJ.code_proj = BL.id_prjt 
        INNER JOIN saison SS ON SS.code_saison = CBL.id_saison
        INNER JOIN beneficiaire BNF ON BNF.code_benef = BPRC.id_benef
        INNER JOIN benef_activ_bl BABL ON BABL.id_benef = BNF.code_benef
        WHERE CBL.status IN("EC") AND BPRC.status = "active" AND BL.status = "active" AND PRJ.statuts = "activer" AND BNF.statut = "active" AND BABL.status = "active"`;

        if (req.body.code_proj != undefined) {
            state += ` AND PRJ.code_proj = "${req.body.code_proj}"`;
        }
        db.query(state, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From cultures_BLOC:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findAllImportCulturePms: function(req, res) {
        console.log("Find Import data");
        //console.log(req);
        var sql = `SELECT CPMS.code_culture, CPMS.id_parce, CPMS.id_var, CPMS.id_saison, CPMS.annee_du, LEFT(CPMS.ddp, 10) AS ddp, CPMS.qsa, CPMS.img_fact, LEFT(CPMS.dds, 10) AS dds, CPMS.sfce, 
                    CPMS.objectif, CPMS.sc, CPMS.ea_id_variette, CPMS.ea_autres, LEFT(CPMS.dt_creation, 10) AS dt_creation, LEFT(CPMS.dt_modification, 10) AS dt_modification, CPMS.statuts, CPMS.Etat 
                    FROM cultures_pms CPMS
                    INNER JOIN assoc_parce AS_PRC ON AS_PRC.code_parce = CPMS.id_parce`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            sql += `  WHERE AS_PRC.id_assoc = "${req.body.code_ass}" AND CPMS.statuts = "EC" AND CPMS.Etat = "validate"`;
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From cultures_pms:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findAllImportSuiviPms: function(req, res) {
        console.log("Find Import data", req.body);
        let code_cult =  new Array();
        code_cult = req.body.data_culture;
        let results = [];
       
        //console.log(req);

        if (req.body.data_culture != undefined) {
            code_cult = req.body.data_culture;
            if (code_cult.length > 0) {
                code_cult.forEach((elem, ind) => {
                    var sql = `SELECT SPMS.id, SPMS.id_culture, LEFT(SPMS.ddp, 10) AS ddp, SPMS.stc, SPMS.ec, SPMS.pb, SPMS.ex, SPMS.img_cult, SPMS.name, SPMS.controle, SPMS.etat 
                             FROM suivi_pms SPMS WHERE SPMS.id_culture = "${elem.code_culture}"`;
                    db.query(sql, (err, rows, field) => {
                        if (!err) {
                            results.push(rows);
                        }
                        if ((code_cult.length - 1) === ind) {
                            return res.status(200).json(results);
                        }
                    });
                });
            }

        } else console.log("requete non valide");
    },
    update_culture: function(req, res) {
        console.log("***update cultures****", req.body);

        if (req.body.add_culture != undefined && req.body.constructor === Object) {
            let req_cult = [];
            req_cult = req.body.add_culture;
            req_cult.forEach((elem_culture, ind) => {
                var query_insert_culture = `INSERT INTO  cultures_pms SET ?`;
                db.query(`SELECT * FROM cultures_pms where code_culture = '${ elem_culture.code_culture }'`, (err_verif, rows_verif_culture, fields) => {
                    if (!err_verif) {
                        if (elem_culture.Etat === 'ToSync') {
                            // New Element
                            console.log("Add new Elem option !!!!!")
                            if (rows_verif_culture == 0) {
                                elem_culture.Etat =  'isSync';
                                db.query(query_insert_culture, elem_culture, (err_insert, rows_insert, fields) => {
                                    if(!err_insert)
                                    {
                                        if ((req_cult.length - 1) === ind) {
                                            return res.send({status: 200, message: "Synchronisation succès!", response: rows_insert});
                                        }
                                    } else console.log('erreurs insertion...', err_insert);
                                });
                            } else  {
                                console.log('Culture déjà Synchroniser');
                                if ((req_cult.length - 1) === ind) {
                                    return res.send({status: 200, message: "Synchronisation succès!"});
                                }
                            }
                        } else {
                            // Updated Element
                            console.log("Updated culture option!!! ", rows_verif_culture);
                            var query_update_mep = `UPDATE cultures_pms SET ? where code_culture = '${ elem_culture.code_culture }'`;

                            if (rows_verif_culture != 0) {
                                rows_verif_culture.forEach((elem, i) => {
                                    console.log(elem.Etat);
                                    if ((rows_verif_culture.length - 1) === i) {
                                        if (elem.Etat === "isSync") {
                                            elem_culture.Etat =  'isSync';
                                        } else elem_culture.Etat =  'isUpdate';
                                    }
                                });
                                db.query(query_update_mep, elem_culture, (err_update, rows_update, fields) => {
                                    if(!err_update)
                                    {
                                        if ((req_cult.length - 1) === ind) {
                                            return res.send({status: 200, message: "Synchronisation succès!", response: rows_update});
                                        }
                                    }
                                    else console.log('erreurs insertion...', err_insert);
                                });
                            } else {
                                console.log('Update mode ::: Culture Inconnue!!! ', rows_verif_culture);
                                if ((req_cult.length - 1) === ind) {
                                    return res.send({status: 200, message: "Synchronisation succès!"});
                                }
                            }
                        }

                    } else console.log('erreurs vérification culture', err_verif);
                });

            });
            //return res.status(200).send({mess : 'add_culture'});
        } else if (req.body.update_culture != undefined && req.body.constructor === Object) {
            console.log("updated cultures", req.body.update_culture);
        }
    },
    update_suivi: (req, res) => {
        console.log("****suivi****", req.body);
        if (req.body.add_suivi != undefined  && req.body.constructor === Object) {
            let req_suivi = [];
            req_suivi = req.body.add_suivi;
            req_suivi.forEach((elem_suivi, ind) => {
                var qr_insert = `INSERT INTO suivi_pms SET ?`;
                db.query(`SELECT * FROM suivi_pms WHERE id = "${elem_suivi.id}"`, (err_verif, rows_verif_suivi, fields) => {
                    if (!err_verif) {
                        if (elem_suivi.etat === 'ToSync') {
                            // Add new suivi
                            console.log("Add new Elem suivi!!");
                            if (rows_verif_suivi == 0) {
                                elem_suivi.etat = 'isSync';
                                db.query(qr_insert, elem_suivi, (err_insert, rows_insert, field_insert) => {
                                    if (!err_insert) {
                                        if ((req_suivi.length - 1) === ind) {
                                            return res.send({status: 200, message: "Synchronisation succès!", response: rows_insert});
                                        }
                                    } else console.log('erreurs insertion...', err_insert);
                                });
                            } else {
                                console.log('suivi déjà Synchroniser');
                                if ((req_suivi.length - 1) === ind) {
                                    return res.send({status: 200, message: "Synchronisation succès!"});
                                }
                            }
                        } else {
                            // Updated suivi
                            console.log("Updated culture option!!! ", rows_verif_suivi);
                            var query_update_suivi = `UPDATE suivi_pms SET ? WHERE id = "${elem_suivi.id}"`;

                            if (rows_verif_suivi != 0) {
                                rows_verif_suivi.forEach((elem, i) => {
                                    console.log(elem.etat);
                                    if ((rows_verif_suivi.length - 1) === i) {
                                        if (elem.etat === "isSync") {
                                            elem_suivi.etat =  'isSync';
                                        } else elem_suivi.etat =  'isUpdate';
                                    }
                                });
                                db.query(query_update_suivi, elem_suivi, (err_update, rows_update, fields) => {
                                    if(!err_update)
                                    {
                                        if ((req_suivi.length - 1) === ind) {
                                            return res.send({status: 200, message: "Synchronisation succès!", response: rows_update});
                                        }
                                    }
                                    else console.log('erreurs insertion...', err_update);
                                });
                            } else {
                                console.log('Update mode ::: Suivi Inconnue!!! ', rows_verif_suivi);
                                if ((req_suivi.length - 1) === ind) {
                                    return res.send({status: 200, message: "Synchronisation succès!"});
                                }
                            }
                        }
                    }
                });
            });
        } else if (req.body.updated_suivi != undefined  && req.body.constructor === Object) {
            console.log('*****updated suivi*****');
            return res.send({status: 200, message: "updated option!"});
        }
    },
    /**
     * UPDATED MEP BLOC
     * 
     */
    find_mep_bloc: function(req, res) {
        var state = `SELECT CBL.code_culture, CBL.id_parce, CBL.id_espece, CBL.id_var, CBL.id_saison, CBL.annee_du, LEFT(CBL.ddp, 10) AS ddp, CBL.qso, LEFT(CBL.dds, 10) AS dds, CBL.sfce, CBL.sc, CBL.ea_autres, CBL.ea_id_variette, CBL.dt_creation, LEFT(CBL.dt_modification, 10) AS dt_modification, CBL.status, CBL.etat, CBL.id_equipe, CBL.type 
                    FROM culture_bl CBL
                    INNER JOIN bloc_parce BPRC ON BPRC.code_parce = CBL.id_parce
                    INNER JOIN bloc BL ON BL.code_bloc = BPRC.id_bloc`;

        if (req.body.id_bloc != undefined) {
            state += ` WHERE BL.status = "active" AND BPRC.status = "active" AND CBL.status IN("EC") AND CBL.etat = "validate" AND BL.code_bloc = "${req.body.id_bloc}"`;
        }
        db.query(state, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From cultures_pms:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    updated_mep_bloc: function(req, res) {
        console.log("***MEP BLOC***", req.body);
        if (req.body.add_mepBl != undefined && req.body.constructor === Object) {
            let req_mep = [];
            req_mep = req.body.add_mepBl;
            req_mep.forEach((elem_mep, ind) => {
                var query_insert_mep = `INSERT INTO culture_bl SET ?`;
                db.query(`SELECT * FROM culture_bl WHERE code_culture = "${elem_mep.code_culture}"`, (err_verif_mep, rows_mep_cult, fields) => {
                    if (!err_verif_mep) {
                        if(elem_mep.etat === 'ToSync') {
                            if (rows_mep_cult == 0) {
                                // Add new element
                                elem_mep.etat =  'isSync';
                                db.query(query_insert_mep, elem_mep, (err_insert, rows_insert, fields) => {
                                    if(!err_insert)
                                    {
                                        if ((req_mep.length - 1) === ind) {
                                            return res.send({status: 200, message: "Synchronisation succès!", response: rows_insert});
                                        }
                                    } else console.log('erreurs insertion...', err_insert);
                                });
                            } else {
                                console.log('++Culture déjà Synchroniser++');
                                if ((req_mep.length - 1) === ind) {
                                    return res.send({status: 200, message: "Synchronisation succès!"});
                                }
                            }
                        } else {
                            // updated Element
                            var query_update_mep = `UPDATE culture_bl SET ? where code_culture = "${elem_mep.code_culture}"`;
                            if (rows_mep_cult != 0) {
                                rows_mep_cult.forEach((elem_rows, i) => {
                                    if ((rows_mep_cult.length - 1) === i) {
                                        if (elem_rows.etat === "isSync") {
                                            elem_mep.etat =  'isSync';
                                        } else elem_mep.etat =  'isUpdate';
                                    }
                                });
                                db.query(query_update_mep, elem_mep, (err_update, rows_update, fields) => {
                                    if(!err_update)
                                    {
                                        if ((req_mep.length - 1) === ind) {
                                            return res.send({status: 200, message: "Synchronisation succès!", response: rows_update});
                                        }
                                    } else console.log('erreurs updated...', err_update);
                                });
                            } else  {
                                console.log('Update mode ::: MEP Inconnue!!! ');
                                if ((req_mep.length - 1) === ind) {
                                    return res.send({status: 200, message: "Synchronisation succès!"});
                                }
                            }
                        }
                    }
                });
            });
        }
    },
    /**
     * UPDATE SUIVI BLOC
     */
    find_suivi_bloc: function(req, res) {
        console.log("***********Find mep********************");
        var state = `SELECT SBL.code_sv, SBL.id_culture, LEFT(SBL.ddp, 10) AS ddp, SBL.stc, SBL.ql, SBL.qr, SBL.long_ligne, SBL.nbre_ligne, SBL.nbre_pied, SBL.img_cult, SBL.ex, SBL.etat 
                    FROM suivi_bl SBL
                    INNER JOIN culture_bl CBL ON CBL.code_culture = SBL.id_culture
                    INNER JOIN bloc_parce BPRC ON BPRC.code_parce = CBL.id_parce
                    INNER JOIN bloc BL ON BL.code_bloc = BPRC.id_bloc`;

        if (req.body.id_bloc != undefined) {
            state += ` WHERE CBL.status IN("EC") AND CBL.etat = "validate" AND SBL.etat = "validate" AND BL.code_bloc = "${req.body.id_bloc}"`;
        }
        db.query(state, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From cultures_pms:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });

    },
    updated_suivi_bloc: function(req, res) {
        console.log("********** Suivi Bloc***********");
        if (req.body.add_suiviBl != undefined && req.body.constructor === Object) {

            let req_suivi = [];
            req_suivi = req.body.add_suiviBl;

            req_suivi.forEach((elem_sv, index) => {
                var query_insert_sv = `INSERT INTO suivi_bl SET ?`;

                db.query(`SELECT * FROM suivi_bl WHERE code_sv = "${elem_sv.code_sv}"`, (err_verif_sv, rows_verif_sv, fields) => {
                    if (!err_verif_sv) {
                        if (elem_sv.etat === 'ToSync') {
                            if (rows_verif_sv == 0) {
                                // Add new element
                                elem_sv.etat =  'isSync';
                                db.query(query_insert_sv, elem_sv, (err_insert, rows_insert, fields) => {
                                    if(!err_insert)
                                    {
                                        if ((req_suivi.length - 1) === index) {
                                            return res.send({status: 200, message: "Synchronisation succès!", response: rows_insert});
                                        }
                                    } else console.log('erreurs insertion...', err_insert);
                                });
                            } else {
                                console.log('++Culture déjà Synchroniser++');
                                if ((req_suivi.length - 1) === index) {
                                    return res.send({status: 200, message: "Synchronisation succès!"});
                                }
                            }
                        } else {
                            // updated Element
                            var query_update_sv = `UPDATE suivi_bl SET ? where code_sv = "${elem_sv.code_sv}"`;

                            if (rows_verif_sv != 0) {
                                // updated 
                                rows_verif_sv.forEach((elem_rows, i) => {
                                    if ((rows_verif_sv.length - 1) === i) {
                                        if (elem_rows.etat === "isSync") {
                                            elem_sv.etat =  'isSync';
                                        } else elem_sv.etat =  'isUpdate';
                                    }
                                });
                                db.query(query_update_sv, elem_sv, (err_update, rows_update, fields) => {
                                    if(!err_update)
                                    {
                                        if ((req_suivi.length - 1) === index) {
                                            return res.send({status: 200, message: "Synchronisation succès!", response: rows_update});
                                        }
                                    } else console.log('erreurs updated...', err_update);
                                });
                            } else {
                                console.log('Update mode ::: MEP Inconnue!!! ');
                                if ((req_suivi.length - 1) === index) {
                                    return res.send({status: 200, message: "Synchronisation succès!"});
                                }
                            }
                        }
                    }
                });
            });
        }
    }
}