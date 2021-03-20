import 'dart:convert';
import 'package:app_practica/src/model/temperatura_model.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

class TemperaturaProvider {
  final String _url = urlPath;
  //==================================================
  //                     HEADERS
  //==================================================
  Map<String, String> headers = {"Content-type": "application/json"};

  //==================================================
  //                     GET ALL
  //==================================================
  Future<List<TemperaturaModel>> getAll() async {
    final url = '$_url/temperatura/get_all';
    final resp = await http.get(url);
    final List<dynamic> decodedData = json.decode(resp.body);

    final List<TemperaturaModel> listData = new List();
    if (decodedData == null) return [];

    decodedData.forEach((dataModel) {
      final dataTemp = TemperaturaModel.fromJson(dataModel);
      listData.add(dataTemp);
    });

    return listData;
  }

  //==================================================
  //                     GET SINGLE
  //==================================================
  Future<TemperaturaModel> getSingle(String id) async {
    final url = '$_url/temperatura/get_$id';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if (decodedData.length == 0) return null;

    TemperaturaModel cursosModel = TemperaturaModel();
    cursosModel = TemperaturaModel.fromJson(decodedData);
    return cursosModel;
  }

  //==================================================
  //                     CREATE
  //==================================================
  Future<bool> create(TemperaturaModel dataModel) async {
    final url = '$_url/temperatura/crear';
    final resp = await http.post(url,
        body: temperaturaModelToJson(dataModel), headers: headers);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  //==================================================
  //                     UPDATE
  //==================================================
  Future<bool> update(TemperaturaModel dataModel) async {
    final url = '$_url/temperatura/update_${dataModel.id}';
    final resp = await http.put(url,
        body: temperaturaModelToJson(dataModel), headers: headers);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  //==================================================
  //                     DELETE
  //==================================================
  Future<int> delete(String id) async {
    final url = '$_url/temperatura/delete_$id';
    final resp = await http.delete(url);
    print(resp.body);
    return 1;
  }
}
