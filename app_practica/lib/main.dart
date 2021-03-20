import 'package:app_practica/src/bloc/provider_bloc.dart';
import 'package:app_practica/src/page/login.dart';
import 'package:app_practica/src/routes/route.dart';
import 'package:app_practica/src/utils/localstorage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localStorage = new LocalStorage();
  await localStorage.initPrefs();
  runApp(
    Provider(
      child: MaterialApp(
          routes: getApplicationRoutes(),
          debugShowCheckedModeBanner: false,
          home: new MyApp(),
          theme: ThemeData(
              // Define el Brightness y Colores por defecto
              primaryColor: Colors.blueAccent,
              accentColor: Colors.blueAccent,
              inputDecorationTheme: InputDecorationTheme(
                  focusColor: Colors.blueAccent,
                  fillColor: Colors.blueAccent,
                  hoverColor: Colors.blueAccent),
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.blueAccent,
              ))),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 2,
        navigateAfterSeconds: LoginPage(),
        image: new Image.asset('assets/img/usac.png'),
        backgroundColor: Colors.white,
        photoSize: 150.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.blueAccent);
  }
}
