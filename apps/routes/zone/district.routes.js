//Imports
var express = require('express');
const districtCtrl = require('../../controller/zone/districtCtrl');

exports.router_district = (function() {
    var districtRouter = express.Router();

    districtRouter.route('/').get(districtCtrl.findAll);
    districtRouter.route('/').post(districtCtrl.findAll);
    districtRouter.route('/insert').get(districtCtrl.insert);
    districtRouter.route('/update').get(districtCtrl.update);
    districtRouter.route('/delete').get(districtCtrl.delete);

    return districtRouter
})();