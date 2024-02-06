import 'package:flutter/material.dart';
import 'learn_colors_widget.dart';
import 'learn_letters_widget.dart';

class LearnWidget extends StatefulWidget {
  @override
  _LearnWidgetState createState() => _LearnWidgetState();
}

class _LearnWidgetState extends State<LearnWidget> {

  @override
  void initState() {
    super.initState();
  }

  void goToLearnColors(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ColorsLearnWidget()),
    );
  }

  void goToLearnLetters(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LettersLearnWidget()),
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
          toolbarHeight: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: _screenWidth*0.05),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: _screenWidth*0.65),
                    child: Image.asset(
                      "assets/images/cat_learn.png",
                      width: _screenWidth*0.25,
                    ),
                  ),
                  Container(
                    width: _screenWidth*0.9,
                    height: _screenHeight*0.35,
                    child: ElevatedButton(
                        onPressed: goToLearnColors,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // <-- Add this line
                          ),
                        ),
                        child: Padding(
                              padding: EdgeInsets.only(bottom: _screenHeight*0.02),
                              child: Text(
                                "Colors",
                                style: TextStyle(
                                    fontSize: 80,
                                    color: Colors.white,
                                    fontFamily: 'Rubik Wet Paint'
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: _screenWidth*0.05),
              child: Container(
                width: _screenHeight*0.9,
                height: _screenHeight*0.35,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFBDDCF9),
                      textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Add this line
                      ),
                    ),
                    child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "1 2 3",
                            style: TextStyle(
                                fontSize: 100,
                                color: Colors.orange,
                                fontFamily: 'RozhaOne'
                            ),
                          ),
                        ),
                    )
                ),
              ),
            Padding(
              padding: EdgeInsets.only(left: _screenWidth*0.05),
              child: Container(
                width: _screenHeight*0.9,
                height: _screenHeight*0.35,
                child: ElevatedButton(
                    onPressed: goToLearnLetters,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEEE5E5),
                      textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Add this line
                      ),
                    ),
                    child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "A B C",
                            style: TextStyle(
                                fontSize: 100,
                                color: Color(0xFF77A9D8),
                                fontFamily: 'RozhaOne'
                            ),
                          ),
                        ),
                    )
                ),
              ),
          ],
        ),
      ),
    );
  }
}