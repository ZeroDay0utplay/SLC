import 'package:fe/pages/hello_widget.dart';
import 'package:flutter/material.dart';
import 'package:fe/middlewares/btConnectivity.dart';



class ConnectivityWidget extends StatefulWidget{
  @override
  _ConnectivityWidgetState createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget>{

  @override
  void initState() {
    super.initState();
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
                padding: EdgeInsets.only(left: _screenWidth*0.26, top: 0.1*_screenHeight),
                child: Text(
                  "Connectivity",
                  style: TextStyle(
                      fontFamily: "Goudy Old Style",
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 0.1*_screenWidth),
                child: Image.asset(
                  "assets/images/cat_verif.png",
                  width: 0.15*_screenWidth,
                  height: 0.15*_screenHeight,
                ),
              ),
            ],
          ),
          toolbarHeight: 0.3*_screenHeight,
        ),

        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0*_screenWidth),
              child: Image.asset(
                "assets/images/connectivity.png",
                width: 0.65*_screenWidth,
                height: 0.6*_screenHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.1*_screenHeight),
              child: Text(
                "Please turn on your cube",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lora",
                    fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.1*_screenWidth, right: 0.1*_screenWidth, bottom: 0.05*_screenHeight),
              child: Text(
                "When Bluetooth is turned on, your device can communicate with your cube. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Inter",
                    color: Color(0xFF979191)
                ),
              ),
            ),
            InkWell(
              onTap: connect2Cube,
              child: Image.asset(
                'assets/images/connectButton.png',
                width: 0.3*_screenWidth,
                height: 0.3*_screenHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Text(
                "Please click the button above",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lora",
                    fontSize: 18
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }

}