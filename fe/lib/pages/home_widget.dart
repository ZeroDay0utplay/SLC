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
          title: Center(
            child: Text(
              "What to do ?",
              style: TextStyle(
                  fontFamily: "Goudy Old Style",
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          toolbarHeight: 150,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Container(
                width: 170,
                height: 520,
                child: ElevatedButton(
                    onPressed: goToLearn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Add this line
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Learn",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: 'Roboto'
                            ),
                          ),
                        ),
                        Image.asset("assets/images/learn.png"),
                      ],
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Container(
                width: 170,
                height: 520,
                child: ElevatedButton(
                    onPressed: goToLearn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFBDDCF9),
                      textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Add this line
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Test",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.orange,
                                fontFamily: 'Roboto'
                            ),
                          ),
                        ),
                        Image.asset("assets/images/test.png"),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
