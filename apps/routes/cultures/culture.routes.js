// Imports
var express = require('express');
const cultureCtrl = require('../../controller/cultures/cultureCtrl');

// Router
exports.router_culture = (function() {
    var cultureRouter = express.Router();

    // fetch all data
    cultureRouter.route('/find_culturepms').post(cultureCtrl.findAllImportCulturePms);

        // fetch all data
    cultureRouter.route('/find_suivipms').post(cultureCtrl.findAllImportSuiviPms);

    //fetch all Mep bloc web
    cultureRouter.route('/find_mep_bloc_wb').post(cultureCtrl.findMepBlocWb);
    cultureRouter.route('/find_mep_bloc_wb').get(cultureCtrl.findMepBlocWb);

    //fetch all Suivi Mep bloc web
    cultureRouter.route('/find_suivi_bloc_wb').post(cultureCtrl.findSuiviBlocWb);
    cultureRouter.route('/find_suivi_bloc_wb').get(cultureCtrl.findSuiviBlocWb);

    // add new culture
    cultureRouter.route('/update').post(cultureCtrl.update_culture);

    // update suivi
    cultureRouter.route('/update_suivi').post(cultureCtrl.update_suivi);

    // update Mep bloc
    cultureRouter.route('/update_mep_bloc').post(cultureCtrl.updated_mep_bloc);

    // find mep bloc
    cultureRouter.route('/find_mep_bloc').post(cultureCtrl.find_mep_bloc);

    // update suivi bloc
    cultureRouter.route('/update_suivi_bloc').post(cultureCtrl.updated_suivi_bloc);

    // update suivi bloc
    cultureRouter.route('/find_suivi_bloc').post(cultureCtrl.find_suivi_bloc);

    return cultureRouter
})();