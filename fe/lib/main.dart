import 'package:fe/pages/connectivity_widget.dart';
import 'package:fe/pages/home_widget.dart';
import 'package:fe/pages/test_widget.dart';
import 'pages/learn_colors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/learn_widget.dart';



Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomeWidget()
    );
  }
}