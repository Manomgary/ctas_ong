//Imports
var express = require('express');
const projetCtrl = require('../../controller/projet/projetCtrl');

exports.router_projet = (function() {
    var projetRouter = express.Router();

    projetRouter.route('/').get(projetCtrl.findAll);
    projetRouter.route('/').post(projetCtrl.findAll);
    projetRouter.route('/projet_equipe').post(projetCtrl.findEquipeProjet);
    projetRouter.route('/findActive').post(projetCtrl.findActiviteProjet);
    projetRouter.route('/insert').get(projetCtrl.insert);
    projetRouter.route('/update').get(projetCtrl.update);
    projetRouter.route('/delete').get(projetCtrl.delete);

    return projetRouter
})();