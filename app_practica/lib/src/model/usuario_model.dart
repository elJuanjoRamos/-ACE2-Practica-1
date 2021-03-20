import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.id,
    this.nombres,
    this.apellidos,
    this.edad = 0,
    this.tipo = 1,
    this.sexo = 'M',
    this.peso = 0,
    this.estatura = 0,
    this.tipoUsuario,
    this.username,
    this.pass,
  });

  int id;
  String nombres;
  String apellidos;
  int edad;
  int tipo;
  String sexo;
  double peso;
  double estatura;
  String tipoUsuario;
  String username;
  String pass;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        edad: json["edad"],
        tipo: json["tipo"],
        sexo: json["sexo"],
        peso: double.parse(json["peso"].toString()),
        estatura: double.parse(json["estatura"].toString()),
        tipoUsuario: json["tipo_usuario"],
        username: json["username"],
        pass: json["pass"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "edad": edad,
        "tipo": tipo,
        "sexo": sexo,
        "peso": peso,
        "estatura": estatura,
        "tipo_usuario": tipoUsuario,
        "username": username,
        "pass": pass,
      };
}
