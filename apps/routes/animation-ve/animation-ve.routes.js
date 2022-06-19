//Imports
var express = require('express');
const animationCtrl = require('../../controller/animation-ve/animationVeCtrl');

exports.router_prBloc = (function() {
    var animationRouter = express.Router();

    animationRouter.route('/findAnimationPr').post(animationCtrl.findAnimationPr);
    animationRouter.route('/findSpeculationAnime').post(animationCtrl.findSpeculationPr)

    return animationRouter
})();