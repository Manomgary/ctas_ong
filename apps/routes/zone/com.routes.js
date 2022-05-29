//Imports
var express = require('express');
const comCtrl = require('../../controller/zone/comCtrl');

exports.router_commune = (function() {
    var comRouter = express.Router();

    comRouter.route('/').get(comCtrl.findAll);
    comRouter.route('/').post(comCtrl.findAll);
    comRouter.route('/insert').get(comCtrl.insert);
    comRouter.route('/update').get(comCtrl.update);
    comRouter.route('/delete').get(comCtrl.delete);

    return comRouter
})();