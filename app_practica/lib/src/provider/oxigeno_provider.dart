import 'dart:convert';
import 'package:app_practica/src/model/oxigeno_model.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

class OxigenoProvider {
  final String _url = urlPath;
  //==================================================
  //                     HEADERS
  //==================================================
  Map<String, String> headers = {"Content-type": "application/json"};

  //==================================================
  //                     GET ALL
  //==================================================
  Future<List<OxigenoModel>> getAll() async {
    final url = '$_url/oxigeno/get_all';
    final resp = await http.get(url);
    final List<dynamic> decodedData = json.decode(resp.body);

    final List<OxigenoModel> listData = new List();
    if (decodedData == null) return [];

    decodedData.forEach((dataModel) {
      final dataTemp = OxigenoModel.fromJson(dataModel);
      listData.add(dataTemp);
    });

    return listData;
  }

  //==================================================
  //                     GET SINGLE
  //==================================================
  Future<OxigenoModel> getSingle(String id) async {
    final url = '$_url/oxigeno/get_$id';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if (decodedData.length == 0) return null;

    OxigenoModel cursosModel = OxigenoModel();
    cursosModel = OxigenoModel.fromJson(decodedData);
    return cursosModel;
  }

  //==================================================
  //                     CREATE
  //==================================================
  Future<bool> create(OxigenoModel dataModel) async {
    final url = '$_url/oxigeno/crear';
    final resp = await http.post(url,
        body: oxigenoModelToJson(dataModel), headers: headers);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  //==================================================
  //                     UPDATE
  //==================================================
  Future<bool> update(OxigenoModel dataModel) async {
    final url = '$_url/oxigeno/update_${dataModel.id}';
    final resp = await http.put(url,
        body: oxigenoModelToJson(dataModel), headers: headers);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  //==================================================
  //                     DELETE
  //==================================================
  Future<int> delete(String id) async {
    final url = '$_url/oxigeno/delete_$id';
    final resp = await http.delete(url);
    print(resp.body);
    return 1;
  }
}
