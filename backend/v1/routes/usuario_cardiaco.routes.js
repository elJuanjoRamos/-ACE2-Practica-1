var express = require('express');
var controller = require('../controllers/usuario_cardicaco.controller');
var router = express.Router();


router.get('/frecuencia/usuario/:id', controller.default.getInstance().get_frecuencia_by_id_user);
router.post('/frecuencia/crear', controller.default.getInstance().create);
router.delete('/frecuencia/usuario/:id', controller.default.getInstance().delete_frecuencia_by_id);


module.exports = router;