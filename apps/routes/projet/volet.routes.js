//Imports
var express = require('express');
const voletCtrl = require('../../controller/projet/voletCtrl');

exports.router_volet = (function() {
    var voletRouter = express.Router();

    voletRouter.route('/').get(voletCtrl.findAll);
    voletRouter.route('/insert').get(voletCtrl.insert);
    voletRouter.route('/update').get(voletCtrl.update);
    voletRouter.route('/delete').get(voletCtrl.delete);

    return voletRouter
})();