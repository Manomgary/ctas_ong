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
        var sql = `SELECT code_act, intitule, description, id_volet FROM activite`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            /**sql += ` WHERE statuts = "EC" AND code_proj = '${req.body.id_projet}'`;*/
            console.log("requete body non null!!");
        }
        db.query(sql, (err, rows, fields) => {
            if (err) {
                return res.status(500).send({ error: 'From activite:::::something failed ' + err});
            }
            return res.status(200).json(rows);
        });
    },
    findActiveColl: function(req, res) {
        console.log(req.body);
        console.log("Call activiter");
        var sql = `SELECT CA.code, CA.id_activ, A.code_act, A.intitule, CA.id_col, C.code_col,  C.nom, C.description
                    FROM collaborateur C 
                    INNER JOIN collaborateur_activ CA ON CA.id_col = C.code_col
                    INNER JOIN activite A ON A.code_act = CA.id_activ`;
        if (!(Object.keys(req.body).length === 0 && req.body.constructor === Object)) {
            console.log("requete body non null!!");
            let activite = req.body.activite;
            let response = [];

            if (activite && activite.length > 0) {
                activite.forEach((elem, i) => {
                    sql_where = sql + ` WHERE CA.id_activ = ${ elem.code_act }`;
                    db.query(sql_where, (err, rows, fields) => {
                        if (err) {
                            return res.status(500).send({ error: 'From collaborateur_activ:::::something failed ' + err});
                        }
                        response.push(rows);
                        console.log(elem);
                        console.log(response);
                        console.log(i);
                        console.log(activite.length);
                        if ( i == (activite.length - 1)) {
                            console.log(response);
                            return res.status(200).json(response);
                        }
                    });               
                });
            }

        } else {
            db.query(sql, (err, rows, fields) => {
                if (err) {
                    return res.status(500).send({ error: 'From collaborateur_activ:::::something failed ' + err});
                }
                return res.status(200).json(rows);
            });
        }
    },
    removeById: function(req, res) {

    },
    removeAll: function(req, res) {
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send('<h1>Bienvenu sur RemoveAll controller</h1>');
    }
}