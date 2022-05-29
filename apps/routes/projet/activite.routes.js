// Imports
var express = require('express');
const activiteCtrl = require('../../controller/projet/activiteCtrl');

// Router
exports.router_activite = (function() {
    var activiteRouter = express.Router();

    // fetch all data
    activiteRouter.route('/').get(activiteCtrl.findAll);

    // fetch all activite collaborateur
    activiteRouter.route('/collaboActive').post(activiteCtrl.findActiveColl);

    // add new activite
    activiteRouter.route('/insert').get(activiteCtrl.add);

    //remove new actvite
    activiteRouter.route('/update').get(activiteCtrl.update);

    // delete all activite
    activiteRouter.route('/delete').get(activiteCtrl.removeAll);

    return activiteRouter
})();