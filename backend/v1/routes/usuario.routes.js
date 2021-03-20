var express = require('express');
var controller = require('../controllers/usuario.controller');
var usuario = express.Router();


usuario.get('/usuario/get_all', controller.default.getInstance().get_all);
usuario.post('/auth', controller.default.getInstance().auth);
usuario.post('/usuario/crear', controller.default.getInstance().create);


module.exports = usuario;