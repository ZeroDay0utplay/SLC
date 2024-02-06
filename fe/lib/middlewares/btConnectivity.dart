import 'package:flutter_blue/flutter_blue.dart';


Future<bool> checkBluetoothConnection() async {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devices = await flutterBlue.connectedDevices;
  return devices.isNotEmpty;
}


void connect2Cube() async {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothService> services;
  BluetoothDevice cube;

  if (flutterBlue.isScanning == false) {
    flutterBlue.startScan();
    flutterBlue.scanResults.listen((scanResults) {
      scanResults.forEach((scanResult) {
        print(scanResult);
      });
    });
    await flutterBlue.stopScan();

    //print(devices);
  }
}