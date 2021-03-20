import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instancia = new LocalStorage._internal();

  factory LocalStorage() {
    return _instancia;
  }

  LocalStorage._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de la última página
  get idUsuario {
    return _prefs.getString('idUsuario') ?? '';
  }

  set idUsuario(String value) {
    _prefs.setString('idUsuario', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }

  // GET y SET autentication
  get autentication {
    return _prefs.getString('autentication') ?? '';
  }

  set autentication(String value) {
    _prefs.setString('autentication', value);
  }

  // GET y SET tipo
  get tipoUsuario {
    return _prefs.getString('tipoUsuario') ?? '';
  }

  set tipoUsuario(String value) {
    _prefs.setString('tipoUsuario', value);
  }

  // GET y SET tipo
  get tokenPush {
    return _prefs.getString('tokenPush') ?? '';
  }

  set tokenPush(String value) {
    _prefs.setString('tokenPush', value);
  }

  // GET AND SET NOMBRE
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  // GET AND SET APELLIDO
  get apellido {
    return _prefs.getString('apellido') ?? '';
  }

  set apellido(String value) {
    _prefs.setString('apellido', value);
  }

  // GET AND SET APELLIDO
  get correo {
    return _prefs.getString('correo') ?? '';
  }

  set correo(String value) {
    _prefs.setString('correo', value);
  }

  // GET AND SET APELLIDO
  get phone {
    return _prefs.getString('phone') ?? '';
  }

  set phone(String value) {
    _prefs.setString('phone', value);
  }

  // GET AND SET APELLIDO
  get imagen {
    return _prefs.getString('imagen') ?? '';
  }

  set imagen(String value) {
    _prefs.setString('imagen', value);
  }
}
