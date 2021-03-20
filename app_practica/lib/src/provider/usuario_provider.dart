import 'dart:convert';
import 'package:app_practica/src/model/usuario_model.dart';
import 'package:app_practica/src/utils/localstorage.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

class UsuarioProvider {
  final String _url = urlPath;
  //==================================================
  //                     HEADERS
  //==================================================
  Map<String, String> headers = {"Content-type": "application/json"};

  //==================================================
  //                     GET ALL
  //==================================================
  Future<List<UsuarioModel>> getAll() async {
    final url = '$_url/usuario/get_all';
    final resp = await http.get(url);
    final List<dynamic> decodedData = json.decode(resp.body);

    final List<UsuarioModel> listData = new List();
    if (decodedData == null) return [];

    decodedData.forEach((dataModel) {
      final dataTemp = UsuarioModel.fromJson(dataModel);
      listData.add(dataTemp);
    });

    return listData;
  }

  //==================================================
  //                     GET ALL
  //==================================================
  Future<List<UsuarioModel>> getAllCoach() async {
    final url = '$_url/usuario/get_all';
    final resp = await http.get(url);
    final List<dynamic> decodedData = json.decode(resp.body);

    final List<UsuarioModel> listData = new List();
    if (decodedData == null) return [];

    decodedData.forEach((dataModel) {
      final dataTemp = UsuarioModel.fromJson(dataModel);
      if (dataTemp.tipoUsuario == "Coach") {
        listData.add(dataTemp);
      }
    });

    return listData;
  }

  //==================================================
  //                     GET SINGLE
  //==================================================
  Future<UsuarioModel> getSingle(String id) async {
    final url = '$_url/usuario/get_$id';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    if (decodedData.length == 0) return null;

    UsuarioModel cursosModel = UsuarioModel();
    cursosModel = UsuarioModel.fromJson(decodedData);
    return cursosModel;
  }

  //==================================================
  //                     CREATE
  //==================================================
  Future<bool> create(UsuarioModel dataModel) async {
    final url = '$_url/usuario/crear';
    final resp = await http.post(url,
        body: usuarioModelToJson(dataModel), headers: headers);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  //==================================================
  //                     UPDATE
  //==================================================
  Future<bool> update(UsuarioModel dataModel) async {
    final url = '$_url/usuario/update_${dataModel.id}';
    final resp = await http.put(url,
        body: usuarioModelToJson(dataModel), headers: headers);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  //==================================================
  //                     DELETE
  //==================================================
  Future<int> delete(String id) async {
    final url = '$_url/usuario/delete_$id';
    final resp = await http.delete(url);
    print(resp.body);
    return 1;
  }

  Future<UsuarioModel> login(UsuarioModel data) async {
    final _localStorage = new LocalStorage();
    UsuarioModel usuarioModel = UsuarioModel();
    final url = '$_url/auth';
    final resp =
        await http.post(url, body: usuarioModelToJson(data), headers: headers);
    final decodedData = json.decode(resp.body);
    if (decodedData.containsKey('id')) {
      usuarioModel = UsuarioModel.fromJson(decodedData);
      _localStorage.idUsuario = usuarioModel.id.toString();
      _localStorage.nombre = usuarioModel.nombres;
      _localStorage.apellido = usuarioModel.apellidos;
      _localStorage.correo = usuarioModel.username;
      _localStorage.tipoUsuario = usuarioModel.tipoUsuario;
    } else {
      usuarioModel = null;
    }
    return usuarioModel;
  }
}
