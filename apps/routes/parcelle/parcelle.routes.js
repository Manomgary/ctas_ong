//Imports
var express = require('express');
const parcelleCtrl = require('../../controller/parcelle/parcelleCtrl');

exports.router_parcelle = (function() {
    var parcelleRouter = express.Router();

    parcelleRouter.route('/').get(parcelleCtrl.findAll);
    parcelleRouter.route('/').post(parcelleCtrl.findAll);
    parcelleRouter.route('/findAllParceBenefBloc').post(parcelleCtrl.findAllParceBenefBloc);
    parcelleRouter.route('/findParcelleAss').post(parcelleCtrl.findParcelleAss);
    parcelleRouter.route('/findParcelleBloc').post(parcelleCtrl.findParcelleBloc);
    parcelleRouter.route('/findParcellePRBloc').post(parcelleCtrl.findParcellePRBloc);
    parcelleRouter.route('/insert').get(parcelleCtrl.insert);
    parcelleRouter.route('/update').get(parcelleCtrl.update);
    parcelleRouter.route('/delete').get(parcelleCtrl.delete);

    return parcelleRouter
})();