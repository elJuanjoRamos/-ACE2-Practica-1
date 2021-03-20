
var database = require("../config/database.config");


var UsuarioController = (function () {
    function UsuarioController() {

        this.get_all = function (req, res) {

            var query = "SELECT nombres, apellidos, edad,sexo, peso, estatura, tipo.nombre as tipo_usuario FROM USUARIO " +
                " JOIN TIPO_USUARIO as tipo ON USUARIO.TIPO = tipo.id"

            database.query(query, function (err, data) {
                if (err) {
                    res.json([]);
                } else {
                    res.json(data);
                }
            });
        };

        this.auth = function (req, res) {
            var query = "SELECT USUARIO.id, nombres, apellidos, edad,sexo, peso, estatura, tipo.nombre as tipo_usuario FROM USUARIO " +
                " JOIN TIPO_USUARIO as tipo ON USUARIO.TIPO = tipo.id" +
                " WHERE username = ? AND pass = ?"

            var body = {
                username: req.body.username,
                pass: req.body.pass
            };

            database.query(query, [body.username, body.pass], function (err, data) {
                if (err) {
                    res.status(400).json({
                        estado: false,
                        status: 400,
                        error: err
                    });
                } else {
                    res.json(data[0]);
                }
            });
        };


        this.create = function (req, res) {
            var query = " CALL Crear_Usuario(?, ?, ?, ?, ?, ?, ?,?,?); ";
            var body = {
                nombres: req.body.nombres,
                apellidos: req.body.apellidos,
                username: req.body.username,
                pass: req.body.pass,
                edad: req.body.edad,
                sexo: req.body.sexo,
                peso: req.body.peso,
                estatura: req.body.estatura,
                tipo: req.body.tipo
            };
            database.query(query, [body.nombres, body.apellidos, body.username, body.pass, body.edad, body.sexo, body.peso, body.estatura, body.tipo], function (err, data) {
                if (err) {
                    res.status(400).json({
                        estado: false,
                        status: 400,
                        error: err
                    });
                } else {
                    if (data[0][0]._existe == 1) {
                        res.json({
                            estado: false,
                            status: 400,
                            mensaje: "El nombre de usuario ya fue usado"
                        });

                    } else {
                        res.json({
                            estado: true,
                            status: 200,
                            mensaje: "El usuario se agrego con exito"
                        });
                    }
                }
            });
        };
    }
    UsuarioController.getInstance = function () {
        return this._instance || (this._instance = new this());
    };
    return UsuarioController;
}());
exports.default = UsuarioController;
