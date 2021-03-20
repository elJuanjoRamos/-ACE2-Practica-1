import 'dart:convert';
import 'package:app_practica/src/model/frecuencia_model.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

class FrecuenciaProvider {
  final String _url = urlPath;
  //==================================================
  //                     HEADERS
  //==================================================
  Map<String, String> headers = {"Content-type": "application/json"};

  //==================================================
  //                     GET ALL
  //==================================================
  Future<List<FrecuenciaModel>> getAll() async {
    final url = '$_url/frecuencia/get_all';
    final resp = await http.get(url);
    final List<dynamic> decodedData = json.decode(resp.body);

    final List<FrecuenciaModel> listData = new List();
    if (decodedData == null) return [];

    decodedData.forEach((dataModel) {
      final dataTemp = FrecuenciaModel.fromJson(dataModel);
      listData.add(dataTemp);
    });

    return listData;
  }

  //==================================================
  //                     GET SINGLE
  //==================================================
  Future<FrecuenciaModel> getSingle(String id) async {
    final url = '$_url/frecuencia/get_$id';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if (decodedData.length == 0) return null;

    FrecuenciaModel cursosModel = FrecuenciaModel();
    cursosModel = FrecuenciaModel.fromJson(decodedData);
    return cursosModel;
  }

  //==================================================
  //                     CREATE
  //==================================================
  Future<bool> create(FrecuenciaModel dataModel) async {
    final url = '$_url/frecuencia/crear';
    final resp = await http.post(url,
        body: frecuenciaModelToJson(dataModel), headers: headers);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  //==================================================
  //                     UPDATE
  //==================================================
  Future<bool> update(FrecuenciaModel dataModel) async {
    final url = '$_url/frecuencia/update_${dataModel.id}';
    final resp = await http.put(url,
        body: frecuenciaModelToJson(dataModel), headers: headers);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  //==================================================
  //                     DELETE
  //==================================================
  Future<int> delete(String id) async {
    final url = '$_url/frecuencia/delete_$id';
    final resp = await http.delete(url);
    print(resp.body);
    return 1;
  }
}
