//Imports
var express = require('express');
const saisonCtrl = require('../../controller/saisonCtrl/saisonCtrl');

exports.router_saison = (function() {
    var saisonRouter = express.Router();

    saisonRouter.route('/').get(saisonCtrl.findAll);
    saisonRouter.route('/insert').get(saisonCtrl.insert);
    saisonRouter.route('/update').get(saisonCtrl.update);
    saisonRouter.route('/delete').get(saisonCtrl.delete);

    return saisonRouter
})();