//Imports
var express = require('express');
const blocCtrl = require('../../controller/bloc/blocCtrl');

exports.router_bloc = (function() {
    var blocRouter = express.Router();

    blocRouter.route('/').get(blocCtrl.findAll);
    blocRouter.route('/').post(blocCtrl.findAll);
    blocRouter.route('/findblocByProjet').post(blocCtrl.findBlocByProjet);
    blocRouter.route('/findBlocByzone').post(blocCtrl.findBlocZone);
    blocRouter.route('/insert').get(blocCtrl.insert);
    blocRouter.route('/update').get(blocCtrl.update);
    blocRouter.route('/delete').get(blocCtrl.delete);

    return blocRouter
})();