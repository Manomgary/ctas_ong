//Imports
var express = require('express');
const associationCtrl = require('../../controller/association/associationCtrl');

exports.router_association = (function() {
    var associationRouter = express.Router();

    associationRouter.route('/').get(associationCtrl.findAll);
    associationRouter.route('/').post(associationCtrl.findAll);
    associationRouter.route('/findassocByProjet').post(associationCtrl.findAssocByProjet);
    associationRouter.route('/insert').get(associationCtrl.insert);
    associationRouter.route('/update').get(associationCtrl.update);
    associationRouter.route('/delete').get(associationCtrl.delete);

    return associationRouter
})();