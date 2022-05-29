// Imports
var express = require('express');
const speculationCtrl = require('../../controller/cultures/speculationCtrl');

// Router
exports.router_speculation = (function() {
    var speculationRouter = express.Router();

    // fetch all data
    speculationRouter.route('/findCategEspece').get(speculationCtrl.findAllCategEspece);
    speculationRouter.route('/findEspece').get(speculationCtrl.findAllEspece);
    speculationRouter.route('/findVariette').get(speculationCtrl.findAllVariette);

    // add new collaborateur
    //speculationRouter.route('/insert').get(speculationCtrl.add);

    //remove new actvite
    speculationRouter.route('/update').get(speculationCtrl.update);

    // delete all collaborateur
    //speculationRouter.route('/delete').get(speculationCtrl.removeAll);

    return speculationRouter
})();