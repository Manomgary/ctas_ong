//Imports
var express = require('express');
const regionCtrl = require('../../controller/zone/regionCtrl');

exports.router_region = (function() {
    var regionRouter = express.Router();

    regionRouter.route('/').get(regionCtrl.findAll);
    regionRouter.route('/insert').get(regionCtrl.insert);
    regionRouter.route('/update').get(regionCtrl.update);
    regionRouter.route('/delete').get(regionCtrl.delete);

    return regionRouter
})();