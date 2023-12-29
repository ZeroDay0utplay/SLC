import 'package:flutter/material.dart';
import 'learn_widget.dart';
import 'test_widget.dart';

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

  void goToTest() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TestWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.width;
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
          toolbarHeight: _screenHeight*0.3,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: _screenWidth*0.05),
              child: Container(
                width: _screenHeight*0.9,
                height: _screenHeight*0.4,
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
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: _screenHeight*0.02),
                          child: Text(
                            "Learn",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: 'Roboto'
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/learn.png",
                          width: _screenWidth*0.25,
                          height: _screenHeight*0.25,
                        ),
                      ],
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: _screenWidth*0.05),
              child: Container(
                width: _screenHeight*0.9,
                height: _screenHeight*0.4,
                child: ElevatedButton(
                    onPressed: goToTest,
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
                          padding: EdgeInsets.only(bottom: _screenHeight*0.02),
                          child: Text(
                            "Test",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.orange,
                                fontFamily: 'Roboto'
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/test.png",
                          width: _screenWidth*0.25,
                          height: _screenHeight*0.25,
                        ),
                      ],
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: _screenWidth*0.05),
              child: Container(
                width: _screenHeight*0.9,
                height: _screenHeight*0.4,
                child: ElevatedButton(
                    onPressed: goToLearn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEEE5E5),
                      textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Add this line
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: _screenHeight*0.02),
                          child: Text(
                            "child's progress",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF77A9D8),
                                fontFamily: 'Roboto'
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/progress.png",
                          width: _screenWidth*0.25,
                          height: _screenHeight*0.25,
                        ),
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
