// Imports
var express = require('express');
const collaborateurCtrl = require('../../controller/Beneficiaire/collaborateursCtrl');

// Router
exports.router_collaborateur = (function() {
    var collaborateurRouter = express.Router();

    // fetch all data
    collaborateurRouter.route('/').get(collaborateurCtrl.findAll);

    // add new collaborateur
    collaborateurRouter.route('/insert').get(collaborateurCtrl.add);

    //remove new actvite
    collaborateurRouter.route('/update').get(collaborateurCtrl.update);

    // delete all collaborateur
    collaborateurRouter.route('/delete').get(collaborateurCtrl.removeAll);

    return collaborateurRouter
})();