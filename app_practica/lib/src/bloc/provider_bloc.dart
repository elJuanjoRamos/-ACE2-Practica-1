import 'package:app_practica/src/bloc/frecuencia_bloc.dart';
import 'package:app_practica/src/bloc/oxigeno_bloc.dart';
import 'package:app_practica/src/bloc/temperatura_bloc.dart';
import 'package:app_practica/src/bloc/usuario_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  //==================================================
  //                    PROPIEDADES
  //==================================================
  final _frecuenciaBloc = new FrecuenciaBloc();
  final _usuarioBloc = new UsuarioBloc();
  final _oxigenoBloc = new OxigenoBloc();
  final _temperaturaBloc = new TemperaturaBloc();

  //==================================================
  //                    INSTANCIA
  //==================================================
  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //==================================================
  //                    PATRON BLOC
  //==================================================

  static FrecuenciaBloc frecuenciaBloc(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._frecuenciaBloc;
  }

  static UsuarioBloc usuarioBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._usuarioBloc;
  }

  static OxigenoBloc oxigenoBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._oxigenoBloc;
  }

  static TemperaturaBloc temperaturaBloc(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._temperaturaBloc;
  }
}
