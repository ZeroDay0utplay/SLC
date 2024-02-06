import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSquare(double _screenHeight, double _screenWidth, String txt, String font, Color bgColor, double fontSize, Function(String,String) fn, String topic){
  return Container(
        width: _screenWidth*0.4,
        height: _screenHeight*0.3,
        child: ElevatedButton(
          onPressed: ()=>fn(txt, topic),
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            textStyle: TextStyle(fontSize: 20, fontFamily: font),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // <-- Add this line
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: _screenHeight*0.02),
            child: Text(
              txt,
              style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                  fontFamily: font
              ),
            ),
          ),
        ),
  );
}