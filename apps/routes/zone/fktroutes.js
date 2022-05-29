//Imports
var express = require('express');
const fktCtrl = require('../../controller/zone/fktCtrl');

exports.router_fkt = (function() {
    var fktRouter = express.Router();

    fktRouter.route('/').get(fktCtrl.findAll);
    fktRouter.route('/').post(fktCtrl.findAll);
    fktRouter.route('/insert').get(fktCtrl.insert);
    fktRouter.route('/update').get(fktCtrl.update);
    fktRouter.route('/delete').get(fktCtrl.delete);

    return fktRouter
})();