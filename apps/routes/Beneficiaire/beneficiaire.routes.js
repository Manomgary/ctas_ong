// Imports
var express = require('express');
const beneficiaireCtrl = require('../../controller/Beneficiaire/beneficiaireCtrl');

// Router
exports.router_beneficiaire = (function() {
    var beneficiaireRouter = express.Router();

    // fetch all data
    beneficiaireRouter.route('/').get(beneficiaireCtrl.findAll);

    // fetch by projet
    beneficiaireRouter.route('/findRpByProjet').post(beneficiaireCtrl.findPmsByProjet);

    // fetch all beneficiaire by bloc
    beneficiaireRouter.route('/findBenefBlocByProjet').post(beneficiaireCtrl.findBenefBlocByProjet);

    // add new beneficiaire
    beneficiaireRouter.route('/insert').get(beneficiaireCtrl.add);

    //remove new actvite
    beneficiaireRouter.route('/update').get(beneficiaireCtrl.update);

    // delete all beneficiaire
    beneficiaireRouter.route('/delete').get(beneficiaireCtrl.removeAll);

    return beneficiaireRouter
})();