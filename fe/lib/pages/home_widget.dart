import 'package:flutter/material.dart';
import 'learn_widget.dart';

class HelloWidget extends StatefulWidget {
  @override
  _HelloWidgetState createState() => _HelloWidgetState();
}

class _HelloWidgetState extends State<HelloWidget> {

  @override
  void initState() {
    super.initState();
  }

  void goToLearn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LearnWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: goToLearn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.9),
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                    textStyle: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                  ),
                  child: Text('Learn', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.withOpacity(0.9),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    textStyle: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                  ),
                  child: Text('Test', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}