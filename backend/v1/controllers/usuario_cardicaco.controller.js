
var database = require("../config/database.config");


var UsuarioCardiacoController = (function () {
    function UsuarioCardiacoController() {


        this.create = function (req, res) {
            var query = " CALL SP_USUARIO_CARD(?, ?); ";
            var body = {
                atleta: req.body.atleta,
                frecuencia: req.body.frecuencia
            };
            database.query(query, [body.atleta, body.frecuencia], function (err, data) {
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
                        mensaje: "La frecuencia cardiaca se agrego con exito"
                    });
                }
            });
        };

        this.get_frecuencia_by_id_user = function (req, res) {
            var query = " SELECT USUARIO_FRECUENCIA_CARDIACA.id, u.nombres, u.apellidos, u.peso, u.sexo, u.estatura, t.nombre as tipo,  frecuencia, fecha FROM USUARIO_FRECUENCIA_CARDIACA " +
                "JOIN USUARIO as u on u.id = USUARIO_FRECUENCIA_CARDIACA.atleta " +
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
        this.delete_frecuencia_by_id = function (req, res) {
            var query = " DELETE FROM USUARIO_FRECUENCIA_CARDIACA WHERE id = ?; ";
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
                        mensaje: "La frecuencia se elimino con exito"
                    });
                }
            });
        };
    }
    UsuarioCardiacoController.getInstance = function () {
        return this._instance || (this._instance = new this());
    };
    return UsuarioCardiacoController;
}());
exports.default = UsuarioCardiacoController;
