import 'package:flutter/material.dart';

class LearnWidget extends StatefulWidget {
  @override
  _LearnWidgetState createState() => _LearnWidgetState();
}

class _LearnWidgetState extends State<LearnWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learn Page'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/learn_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.withOpacity(0.9),
                    padding: EdgeInsets.symmetric(horizontal: 55, vertical: 20),
                    textStyle: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                  ),
                  child: Text('Colors', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.withOpacity(0.9),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                    textStyle: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                  ),
                  child: Text('1 2 3', style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.withOpacity(0.9),
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 20),
                    textStyle: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                  ),
                  child: Text('A B C', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}