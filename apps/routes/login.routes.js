//Imports
var express = require('express');
const loginCtrl = require('../controller/loginCtrl');

exports.router_login = (function() {
    var loginRouter = express.Router();

    loginRouter.route('/').get(loginCtrl.findAll);
    loginRouter.route('/login').post(loginCtrl.login);
    loginRouter.route('/insert').get(loginCtrl.insert);
    loginRouter.route('/update').get(loginCtrl.update);
    loginRouter.route('/delete').get(loginCtrl.delete);

    return loginRouter
})();