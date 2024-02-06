import 'package:fe/pages/hello_widget.dart';
import 'package:flutter/material.dart';
import '../Components/learn_square.dart';
import '../routes/learnAPI.dart';



class ColorsLearnWidget extends StatefulWidget{
  @override
  _ColorsLearnWidgetState createState() => _ColorsLearnWidgetState();
}

class _ColorsLearnWidgetState extends State<ColorsLearnWidget>{

  @override
  void initState() {
    super.initState();
  }


  void goToHome(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelloWidget()),
    );
  }

  @override
  Widget build(BuildContext context){
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.7*_screenWidth),
                child: Image.asset(
                  "assets/images/cat_verif.png",
                  width: 0.2*_screenWidth,
                  height: 0.3*_screenHeight,
                ),
              ),
            ],
          ),
          toolbarHeight: 0.2*_screenHeight,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 0.1*_screenWidth),
                  child: buildSquare(_screenHeight, _screenWidth, "RED", "Righteous", Colors.red, 60, learnBTN, "colors"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: buildSquare(_screenHeight, _screenWidth, "YELLOW", "Righteous", Colors.yellow, 45, learnBTN, "colors"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 0.1*_screenWidth),
                  child: buildSquare(_screenHeight, _screenWidth, "BLUE", "Righteous", Colors.blue, 60, learnBTN, "colors"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: buildSquare(_screenHeight, _screenWidth, "GREEN", "Righteous", Colors.lightGreen, 60, learnBTN, "colors"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 0.1*_screenWidth),
                  child: buildSquare(_screenHeight, _screenWidth, "VIOLET", "Righteous", Colors.indigoAccent, 55, learnBTN, "colors"),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: buildSquare(_screenHeight, _screenWidth, "INDIGO", "Righteous", Colors.indigo, 55, learnBTN, "colors"),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: buildSquare(_screenHeight, _screenWidth, "ORANGE", "Righteous", Colors.orange, 47, learnBTN, "colors"),
            )
          ],
        )
      ),
    );
  }

}