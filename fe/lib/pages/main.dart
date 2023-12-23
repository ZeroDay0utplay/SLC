import 'package:fe/pages/hello.dart';
import 'package:fe/pages/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../routes/login.route.dart';
import '../routes/learn.route.dart';
import '../auth.dart';
import 'login_widget.dart';
import 'register_widget.dart';

void main() {
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