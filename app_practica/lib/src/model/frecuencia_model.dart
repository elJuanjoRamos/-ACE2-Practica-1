import 'dart:convert';

FrecuenciaModel frecuenciaModelFromJson(String str) =>
    FrecuenciaModel.fromJson(json.decode(str));

String frecuenciaModelToJson(FrecuenciaModel data) =>
    json.encode(data.toJson());

class FrecuenciaModel {
  FrecuenciaModel({
    this.id,
    this.atleta,
    this.nombres,
    this.apellidos,
    this.peso,
    this.sexo,
    this.estatura,
    this.tipo,
    this.frecuencia,
  });

  int id;
  int atleta;
  String nombres;
  String apellidos;
  int peso;
  String sexo;
  int estatura;
  String tipo;
  double frecuencia;

  factory FrecuenciaModel.fromJson(Map<String, dynamic> json) =>
      FrecuenciaModel(
        id: json["id"],
        atleta: json["atleta"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        peso: json["peso"],
        sexo: json["sexo"],
        estatura: json["estatura"],
        tipo: json["tipo"],
        frecuencia: json["frecuencia"],
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
        "frecuencia": frecuencia,
      };
}
