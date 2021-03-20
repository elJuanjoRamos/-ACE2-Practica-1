import 'package:app_practica/src/page/comunication.dart';
import 'package:app_practica/src/page/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DevicePage extends StatefulWidget {
  DevicePage({Key key}) : super(key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SelectBondedDevicePage(
      onCahtPage: (device1) {
        BluetoothDevice device = device1;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ComunicationPage(server: device);
            },
          ),
        );
      },
    ));
  }
}
