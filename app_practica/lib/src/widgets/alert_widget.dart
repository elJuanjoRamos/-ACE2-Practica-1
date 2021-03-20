import 'package:flutter/material.dart';

void mostrarAlert(BuildContext context, String titulo, String descripcion) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(titulo),
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(color: Colors.white),
          contentTextStyle: TextStyle(color: Colors.white),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(descripcion),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: new Image(
                  image: new AssetImage("assets/img/usac.png"),
                  height: 125,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
