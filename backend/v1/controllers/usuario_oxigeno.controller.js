
var database = require("../config/database.config");


var UsuarioOxigenoController = (function () {
    function UsuarioOxigenoController() {


        this.create = function (req, res) {
            var query = " CALL SP_USUARIO_OXI(?, ?); ";
            var body = {
                atleta: req.body.atleta,
                oxigeno: req.body.oxigeno
            };
            database.query(query, [body.atleta, body.oxigeno], function (err, data) {
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
                        mensaje: "El oxigeno se agrego con exito"
                    });
                }
            });
        };

        this.get_oxigeno_by_id_user = function (req, res) {
            var query = " SELECT USUARIO_OXIGENO.id, u.nombres, u.apellidos, u.peso, u.sexo, u.estatura, t.nombre as tipo,  temperatura, fecha FROM USUARIO_OXIGENO " +
                "JOIN USUARIO as u on u.id = USUARIO_OXIGENO.atleta " +
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
        this.delete_oxigeno_by_id = function (req, res) {
            var query = " DELETE FROM USUARIO_OXIGENO WHERE id = ?; ";
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
    UsuarioOxigenoController.getInstance = function () {
        return this._instance || (this._instance = new this());
    };
    return UsuarioOxigenoController;
}());
exports.default = UsuarioOxigenoController;
