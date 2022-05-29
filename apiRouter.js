// Imports
var express = require('express');
const users = require('./apps/routes/login.routes').router_login;
var activite = require('./apps/routes/projet/activite.routes').router_activite;
const projet = require('./apps/routes/projet/projet.routes').router_projet;
const volet = require('./apps/routes/projet/volet.routes').router_volet;
const region = require('./apps/routes/zone/region.routes').router_region;
const district = require('./apps/routes/zone/district.routes').router_district;
const commune = require('./apps/routes/zone/com.routes').router_commune;
const fkt = require('./apps/routes/zone/fktroutes').router_fkt;
const collaborateur = require('./apps/routes/Beneficiaire/collaborateur.routes').router_collaborateur;
const bloc = require('./apps/routes/bloc/bloc.routes').router_bloc;
const association = require('./apps/routes/association/association.routes').router_association;
const beneficiaire = require('./apps/routes/Beneficiaire/beneficiaire.routes').router_beneficiaire;
const equipe = require('./apps/routes/Equipe/equipe.routes').router_equipe;
const parcelle = require('./apps/routes/parcelle/parcelle.routes').router_parcelle;
const saison = require('./apps/routes/saison/saison.routes').router_saison;
const speculation = require('./apps/routes/cultures/speculation.routes').router_speculation;
const culture = require('./apps/routes/cultures/culture.routes').router_culture;

//Router
exports.router = (function() {
    var apiRouter = express.Router();

    //utilisateurs
    apiRouter.use('/users/', users);

    // activite router
    apiRouter.use('/activite/', activite);

    // projet router
    apiRouter.use('/projet/', projet);

    // projet router
    apiRouter.use('/equipe/', equipe);

    // activiter router
    apiRouter.use('/volet/', volet);

    // Region router
    apiRouter.use('/region/', region);

    // Region router
    apiRouter.use('/district/', district);

    // Region router
    apiRouter.use('/commune/', commune);

    // fkt
    apiRouter.use('/fonkotany/', fkt);

    // collaborateur
    apiRouter.use('/collaborateur/', collaborateur);

    // beneficiaire
    apiRouter.use('/beneficiaire/', beneficiaire);

    // bloc
    apiRouter.use('/bloc/', bloc);

    // association
    apiRouter.use('/association/', association);

    // association
    apiRouter.use('/parcelle/', parcelle);

    // saison
    apiRouter.use('/saison/', saison);

    // speculation
    apiRouter.use('/speculation/', speculation);

    // speculation
    apiRouter.use('/culture/', culture);

    return apiRouter;
})();