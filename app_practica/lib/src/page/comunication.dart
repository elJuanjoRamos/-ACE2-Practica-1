import 'dart:async';
import 'dart:convert';
import 'package:app_practica/src/model/frecuencia_model.dart';
import 'package:app_practica/src/model/oxigeno_model.dart';
import 'package:app_practica/src/model/temperatura_model.dart';
import 'package:app_practica/src/provider/frecuencia_provider.dart';
import 'package:app_practica/src/provider/oxigeno_provider.dart';
import 'package:app_practica/src/provider/temperatura_provider.dart';
import 'package:app_practica/src/utils/localstorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ComunicationPage extends StatefulWidget {
  final BluetoothDevice server;

  const ComunicationPage({this.server});

  @override
  _ComunicationPage createState() => new _ComunicationPage();
}

class _Message {
  int whom;
  String text;
  LocalStorage localStorage = new LocalStorage();

  _Message(int whom, String text) {
    this.whom = whom;
    this.text = text;
    // if (whom == 1) {
    //   print("==============================");
    //   print("EVALUACION DATOS");
    //   // ignore: todo
    //   if (this.text.trim().contains('temp')) {
    //     print('TEMP EVALUAR');
    //     print(this.text.trim().replaceAll("temp", "").replaceAll(" ", ""));
    //     double decimal = double.parse(this.text.trim().replaceAll("temp", ""));
    //     print("DECIMAL");
    //     print(decimal);
    //     /**
    //      * AGREGAR TEMPERATURA EN EL BACKEND
    //      */
    //     TemperaturaModel temperaturaModel = new TemperaturaModel();
    //     temperaturaModel.atleta = int.parse(localStorage.idUsuario);
    //     temperaturaModel.temperatura = double.parse(
    //         this.text.trim().replaceAll("temp", "").replaceAll(" ", ""));
    //     print("TEMPERATURA MODELO");
    //     print(temperaturaModel.atleta);
    //     print(temperaturaModel.temperatura);
    //     print("TEMPERATURA MODELO");
    //     TemperaturaProvider temperaturaProvider = new TemperaturaProvider();
    //     temperaturaProvider.create(temperaturaModel);
    //   } else if (this.text.contains('ox')) {
    //     print('OXIGENO');
    //     print(this.text.replaceAll("ox", ""));
    //     /**
    //    * AGREGAR OXIGENO EN EL BACKEND
    //    */
    //     OxigenoModel oxigenoModel = new OxigenoModel();
    //     oxigenoModel.atleta = int.parse(localStorage.idUsuario);
    //     oxigenoModel.oxigeno = double.parse(
    //         this.text.trim().replaceAll("ox", "").replaceAll(" ", ""));
    //     OxigenoProvider oxigenoProvider = new OxigenoProvider();
    //     oxigenoProvider.create(oxigenoModel);
    //   } else if (this.text.contains('fre')) {
    //     print('FRECUENCIA');
    //     print(this.text.replaceAll("fre", ""));
    //     /**
    //    * AGREGAR FRECUENCIA EN EL BACKEND
    //    */
    //     FrecuenciaModel frecuenciaModel = new FrecuenciaModel();
    //     frecuenciaModel.atleta = int.parse(localStorage.idUsuario);
    //     frecuenciaModel.frecuencia = double.parse(
    //         this.text.trim().replaceAll("fre", "").replaceAll(" ", ""));
    //     FrecuenciaProvider frecuenciaProvider = new FrecuenciaProvider();
    //     frecuenciaProvider.create(frecuenciaModel);
    //   } else {
    //     print('NEL');
    //   }
    //   print("==============================");
    // }
  }
}

class _ComunicationPage extends State<ComunicationPage> {
  static final clientID = 0;
  BluetoothConnection connection;

  List<_Message> messages = List<_Message>();

  final TextEditingController textEditingController =
      new TextEditingController();
  final ScrollController listScrollController = new ScrollController();

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;
  String parametroRecibido;

  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
      LocalStorage localStorage = new LocalStorage();

      // connection.input.listen(_onDataReceived).onDone(() {
      //   // Example: Detect which side closed the connection
      //   // There should be `isDisconnecting` flag to show are we are (locally)
      //   // in middle of disconnecting process, should be set before calling
      //   // `dispose`, `finish` or `close`, which all causes to disconnect.
      //   // If we except the disconnection, `onDone` should be fired as result.
      //   // If we didn't except this (no flag set), it means closing by remote.
      //   print("RECIBIENDO");

      //   if (isDisconnecting) {
      //     print('Disconnecting locally!');
      //   } else {
      //     print('Disconnected remotely!');
      //   }
      //   if (this.mounted) {
      //     setState(() {});
      //   }
      // });
      connection.input.listen((data) {
        // print('Data incoming: ${ascii.decode(data)}');
        // connection.output.add(data); // Sending data
        if (ascii.decode(data) == 't') {
          print('==============================');
          print('         TEMPERATURA          ');
          print('==============================');
          print(this.parametroRecibido);
          print('==============================');
          // messages.add(
          //   _Message(1, "T:" + this.parametroRecibido),
          // );

          /**
           * AGREGAR TEMPERATURA EN EL BACKEND
           */
          try {
            TemperaturaModel temperaturaModel = new TemperaturaModel();
            temperaturaModel.atleta = int.parse(localStorage.idUsuario);
            temperaturaModel.temperatura = double.parse(this.parametroRecibido);
            TemperaturaProvider temperaturaProvider = new TemperaturaProvider();
            temperaturaProvider.create(temperaturaModel);
          } catch (e) {
            print('NO VALIDO');
          }

          this.parametroRecibido = '';
        } else if (ascii.decode(data) == 'o') {
          print('==============================');
          print('            OXIGENO           ');
          print('==============================');
          print(this.parametroRecibido);
          print('==============================');
          // messages.add(
          //   _Message(1, "O:" + this.parametroRecibido),
          // );
          /**
       * AGREGAR OXIGENO EN EL BACKEND
       */
          try {
            OxigenoModel oxigenoModel = new OxigenoModel();
            oxigenoModel.atleta = int.parse(localStorage.idUsuario);
            oxigenoModel.oxigeno = double.parse(this.parametroRecibido);
            OxigenoProvider oxigenoProvider = new OxigenoProvider();
            oxigenoProvider.create(oxigenoModel);
          } catch (e) {
            print('NO VALIDO');
          }
          this.parametroRecibido = '';
        } else if (ascii.decode(data) == 'f') {
          print('==============================');
          print('          FRECUENCIA          ');
          print('==============================');
          print(this.parametroRecibido);
          print('==============================');
          // messages.add(
          //   _Message(1, "F:" + this.parametroRecibido),
          // );
          /**
       * AGREGAR FRECUENCIA EN EL BACKEND
       */
          try {
            FrecuenciaModel frecuenciaModel = new FrecuenciaModel();
            frecuenciaModel.atleta = int.parse(localStorage.idUsuario);
            frecuenciaModel.frecuencia = double.parse(this.parametroRecibido);
            FrecuenciaProvider frecuenciaProvider = new FrecuenciaProvider();
            frecuenciaProvider.create(frecuenciaModel);
          } catch (e) {
            print(e);
          }
          this.parametroRecibido = '';
        } else {
          //print(ascii.decode(data));
          if (ascii.decode(data).toString().contains('t')) {
            var contenido = ascii.decode(data).toString().split('t');
            this.parametroRecibido = this.parametroRecibido + contenido[0];
            this.parametroRecibido = '';
            this.parametroRecibido = this.parametroRecibido + contenido[1];
          } else if (ascii.decode(data).toString().contains('o')) {
            var contenido = ascii.decode(data).toString().split('o');
            this.parametroRecibido = this.parametroRecibido + contenido[0];
            this.parametroRecibido = '';
            this.parametroRecibido = this.parametroRecibido + contenido[1];
          } else if (ascii.decode(data).toString().contains('f')) {
            var contenido = ascii.decode(data).toString().split('f');
            this.parametroRecibido = this.parametroRecibido + contenido[0];
            this.parametroRecibido = '';
            this.parametroRecibido = this.parametroRecibido + contenido[1];
          } else {
            this.parametroRecibido =
                this.parametroRecibido + ascii.decode(data);
          }
        }

        if (ascii.decode(data).contains('!')) {
          connection.finish(); // Closing connection
          print('Disconnecting by local host');
        }
      }).onDone(() {
        print('Disconnected by remote request');
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Row> list = messages.map((_message) {
      return Row(
        children: <Widget>[
          Container(
            child: Text(
                (text) {
                  return text == '/shrug' ? '¯\\_(ツ)_/¯' : text;
                }(_message.text.trim()),
                style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            width: 222.0,
            decoration: BoxDecoration(
                color:
                    _message.whom == clientID ? Colors.blueAccent : Colors.grey,
                borderRadius: BorderRadius.circular(7.0)),
          ),
        ],
        mainAxisAlignment: _message.whom == clientID
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
          title: (isConnecting
              ? Text('Connecting chat to ' + widget.server.name + '...')
              : isConnected
                  ? Text('Live chat with ' + widget.server.name)
                  : Text('Chat log with ' + widget.server.name))),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              child: FittedBox(
                child: Row(
                  children: [
                    FlatButton(
                      onPressed:
                          isConnected ? () => _sendMessage('abrir') : null,
                      child: ClipOval(child: Image.asset('assets/img/fre.png')),
                    ),
                    FlatButton(
                      onPressed:
                          isConnected ? () => _sendMessage('cerrar') : null,
                      child:
                          ClipOval(child: Image.asset('assets/img/hola.jpg')),
                    ),
                    FlatButton(
                      onPressed:
                          isConnected ? () => _sendMessage('temp') : null,
                      child:
                          ClipOval(child: Image.asset('assets/img/usac.png')),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: ListView(
                  padding: const EdgeInsets.all(12.0),
                  controller: listScrollController,
                  children: list),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      style: const TextStyle(fontSize: 15.0),
                      controller: textEditingController,
                      decoration: InputDecoration.collapsed(
                        hintText: isConnecting
                            ? 'Wait until connected...'
                            : isConnected
                                ? 'Type your message...'
                                : 'Chat got disconnected',
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      enabled: isConnected,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: isConnected
                          ? () => _sendMessage(textEditingController.text)
                          : null),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // void _onDataReceived(Uint8List data) {
  //   // Allocate buffer for parsed data

  //   int backspacesCounter = 0;
  //   data.forEach((byte) {
  //     if (byte == 8 || byte == 127) {
  //       backspacesCounter++;
  //     }
  //   });
  //   Uint8List buffer = Uint8List(data.length - backspacesCounter);
  //   int bufferIndex = buffer.length;

  //   // Apply backspace control character
  //   backspacesCounter = 0;
  //   for (int i = data.length - 1; i >= 0; i--) {
  //     if (data[i] == 8 || data[i] == 127) {
  //       backspacesCounter++;
  //     } else {
  //       if (backspacesCounter > 0) {
  //         backspacesCounter--;
  //       } else {
  //         buffer[--bufferIndex] = data[i];
  //       }
  //     }
  //   }

  //   // Create message if there is new line character
  //   String dataString = String.fromCharCodes(buffer);
  //   print(dataString);

  //   int index = buffer.indexOf(13);
  //   if (~index != 0) {
  //     setState(() {
  //       messages.add(
  //         _Message(
  //           1,
  //           backspacesCounter > 0
  //               ? _messageBuffer.substring(
  //                   0, _messageBuffer.length - backspacesCounter)
  //               : _messageBuffer + dataString.substring(0, index),
  //         ),
  //       );
  //       // print("RECIBIENDO DATOS");
  //       // var variable = backspacesCounter > 0
  //       //     ? _messageBuffer.substring(
  //       //         0, _messageBuffer.length - backspacesCounter)
  //       //     : _messageBuffer + dataString.substring(0, index);
  //       // print(variable);
  //       // var variableSinEnter = variable.replaceAll("\n", " ");
  //       // print(variableSinEnter);

  //       // print("RECIBIENDO DATOS");
  //       print('======================');
  //       print(_messageBuffer);
  //       print('======================');
  //       _messageBuffer = dataString.substring(index);
  //     });
  //   } else {
  //     _messageBuffer = (backspacesCounter > 0
  //         ? _messageBuffer.substring(
  //             0, _messageBuffer.length - backspacesCounter)
  //         : _messageBuffer);
  //     print('======================');
  //     print(_messageBuffer);
  //     print('======================');
  //   }
  // }

  void _sendMessage(String text) async {
    text = text.trim();
    textEditingController.clear();

    if (text.length > 0) {
      try {
        connection.output.add(utf8.encode(text));
        await connection.output.allSent;

        setState(() {
          messages.add(_Message(clientID, text));
        });

        Future.delayed(Duration(milliseconds: 333)).then((_) {
          listScrollController.animateTo(
              listScrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 333),
              curve: Curves.easeOut);
        });
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}
