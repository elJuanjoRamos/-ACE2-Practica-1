import 'dart:convert';

TemperaturaModel temperaturaModelFromJson(String str) =>
    TemperaturaModel.fromJson(json.decode(str));

String temperaturaModelToJson(TemperaturaModel data) =>
    json.encode(data.toJson());

class TemperaturaModel {
  TemperaturaModel({
    this.atleta,
    this.id,
    this.nombres,
    this.apellidos,
    this.peso,
    this.sexo,
    this.estatura,
    this.tipo,
    this.temperatura,
    this.fecha,
  });

  int atleta;
  int id;
  String nombres;
  String apellidos;
  int peso;
  String sexo;
  int estatura;
  String tipo;
  double temperatura;
  DateTime fecha;

  factory TemperaturaModel.fromJson(Map<String, dynamic> json) =>
      TemperaturaModel(
          atleta: json["atleta"],
          id: json["id"],
          nombres: json["nombres"],
          apellidos: json["apellidos"],
          peso: json["peso"],
          sexo: json["sexo"],
          estatura: json["estatura"],
          tipo: json["tipo"],
          temperatura: json["temperatura"].toDouble());

  Map<String, dynamic> toJson() => {
        "atleta": atleta,
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "peso": peso,
        "sexo": sexo,
        "estatura": estatura,
        "tipo": tipo,
        "temperatura": temperatura,
      };
}
