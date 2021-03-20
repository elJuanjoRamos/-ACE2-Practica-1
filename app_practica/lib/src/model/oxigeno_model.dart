import 'dart:convert';

OxigenoModel oxigenoModelFromJson(String str) =>
    OxigenoModel.fromJson(json.decode(str));

String oxigenoModelToJson(OxigenoModel data) => json.encode(data.toJson());

class OxigenoModel {
  OxigenoModel({
    this.id,
    this.atleta,
    this.nombres,
    this.apellidos,
    this.peso,
    this.sexo,
    this.estatura,
    this.tipo,
    this.oxigeno,
  });

  int id;
  int atleta;
  String nombres;
  String apellidos;
  int peso;
  String sexo;
  int estatura;
  String tipo;
  double oxigeno;

  factory OxigenoModel.fromJson(Map<String, dynamic> json) => OxigenoModel(
        id: json["id"],
        atleta: json["atleta"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        peso: json["peso"],
        sexo: json["sexo"],
        estatura: json["estatura"],
        tipo: json["tipo"],
        oxigeno: json["oxigeno"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "atleta": atleta,
        "nombres": nombres,
        "apellidos": apellidos,
        "peso": peso,
        "sexo": sexo,
        "estatura": estatura,
        "tipo": tipo,
        "oxigeno": oxigeno,
      };
}
