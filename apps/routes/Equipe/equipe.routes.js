// Imports
var express = require('express');
const equipeCtrl = require('../../controller/equipe/equipeCtrl');

// Router
exports.router_equipe = (function() {
    var equipeRouter = express.Router();

    // fetch all data
    equipeRouter.route('/').get(equipeCtrl.findAll);

    // fetch all data
    equipeRouter.route('/').post(equipeCtrl.findAll);

    // add new equipe
    equipeRouter.route('/insert').get(equipeCtrl.add);

    //remove new actvite
    equipeRouter.route('/update').get(equipeCtrl.update);

    // delete all equipe
    equipeRouter.route('/delete').get(equipeCtrl.removeAll);

    return equipeRouter
})();