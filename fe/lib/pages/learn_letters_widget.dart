import 'package:fe/pages/hello_widget.dart';
import 'package:flutter/material.dart';
import '../Components/learn_square.dart';
import '../routes/learnAPI.dart';



class LettersLearnWidget extends StatefulWidget{
  @override
  _LettersLearnWidgetState createState() => _LettersLearnWidgetState();
}

class _LettersLearnWidgetState extends State<LettersLearnWidget>{

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
                  padding: EdgeInsets.only(left: 0.75*_screenWidth),
                  child: Image.asset(
                      "assets/images/cat_verif.png"
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
                    child: buildSquare(_screenHeight, _screenWidth, "A", "Righteous", Colors.red, 100, learnBTN, "letters"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: buildSquare(_screenHeight, _screenWidth, "B", "Righteous", Colors.yellow, 100, learnBTN, "letters"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 0.1*_screenWidth),
                    child: buildSquare(_screenHeight, _screenWidth, "C", "Righteous", Colors.blue, 100, learnBTN, "letters"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: buildSquare(_screenHeight, _screenWidth, "D", "Righteous", Colors.lightGreen, 100, learnBTN, "letters"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 0.1*_screenWidth),
                    child: buildSquare(_screenHeight, _screenWidth, "E", "Righteous", Colors.indigoAccent, 100, learnBTN, "letters"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: buildSquare(_screenHeight, _screenWidth, "F", "Righteous", Colors.indigo, 100, learnBTN, "letters"),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: buildSquare(_screenHeight, _screenWidth, "G", "Righteous", Colors.orange, 100, learnBTN, "letters"),
              )
            ],
          )
      ),
    );
  }

}