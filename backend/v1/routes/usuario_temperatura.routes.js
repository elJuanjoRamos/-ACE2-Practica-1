var express = require('express');
var controller = require('../controllers/usuario_temperatura.controller');
var router = express.Router();


router.get('/temperatura/usuario/:id', controller.default.getInstance().get_temperatura_by_id_user);
router.post('/temperatura/crear', controller.default.getInstance().create);
router.delete('/temperatura/usuario/:id', controller.default.getInstance().delete_temperatura_by_id);


module.exports = router;