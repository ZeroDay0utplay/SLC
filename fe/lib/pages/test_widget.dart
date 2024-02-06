import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {

  @override
  void initState() {
    super.initState();
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
                        onPressed: (){},
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
                    onPressed: (){},
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