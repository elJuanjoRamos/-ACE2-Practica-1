import 'package:app_practica/src/page/bluetooth.dart';
import 'package:app_practica/src/page/login.dart';
import 'package:app_practica/src/page/register.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    /**
     * LOGIN & REGISTRO
     */
    'login': (BuildContext context) => LoginPage(),
    'register': (BuildContext context) => RegisterPage(),
    'bluetooth': (BuildContext context) => BluetoothPage(),
  };
}
