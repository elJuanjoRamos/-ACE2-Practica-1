
var database = require("../config/database.config");


var UsuarioTemperaturaController = (function () {
    function UsuarioTemperaturaController() {


        this.create = function (req, res) {
            var query = " CALL SP_USUARIO_TEMP(?, ?); ";
            var body = {
                atleta: req.body.atleta,
                temperatura: req.body.temperatura
            };
            database.query(query, [body.atleta, body.temperatura], function (err, data) {
                if (err) {
                    res.status(400).json({
                        estado: false,
                        status: 400,
                        error: err
                    });
                } else {
                    res.json({
                        estado: true,
                        status: 200,
                        mensaje: "La temperatura se agrego con exito"
                    });
                }
            });
        };

        this.get_temperatura_by_id_user = function (req, res) {
            var query = " SELECT u.nombres, u.apellidos, u.peso, u.sexo, u.estatura, t.nombre as tipo,  temperatura, fecha FROM USUARIO_TEMPERATURA " +
                "JOIN USUARIO as u on u.id = USUARIO_TEMPERATURA.atleta " +
                "JOIN TIPO_USUARIO as t ON u.tipo = t.id WHERE atleta = ? ";
            var id = req.params.id
            database.query(query, [id], function (err, data) {
                if (err) {
                    res.status(400).json({
                        estado: false,
                        status: 400,
                        error: err
                    });
                } else {
                    res.json(data);
                }
            });
        };
        this.delete_temperatura_by_id = function (req, res) {
            var query = " DELETE FROM USUARIO_TEMPERATURA WHERE id = ?; ";
            var id = req.params.id
            database.query(query, [id], function (err, data) {
                if (err) {
                    res.status(400).json({
                        estado: false,
                        status: 400,
                        error: err
                    });
                } else {
                    res.json({
                        estado: true,
                        status: 200,
                        mensaje: "La temperatura se elimino con exito"
                    });
                }
            });
        };
    }
    UsuarioTemperaturaController.getInstance = function () {
        return this._instance || (this._instance = new this());
    };
    return UsuarioTemperaturaController;
}());
exports.default = UsuarioTemperaturaController;
