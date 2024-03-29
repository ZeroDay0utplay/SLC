import 'package:fe/middlewares/alerts.dart';
import 'package:fe/pages/hello_widget.dart';
import 'package:flutter/material.dart';
import '../routes/resend.route.dart';
import 'dart:async';
import '../routes/verif.email.route.dart';


class EmailVerifWidget extends StatefulWidget{
  final String email;
  EmailVerifWidget({required this.email});
  @override
  _EmailVerifWidgetState createState() => _EmailVerifWidgetState();
}

class _EmailVerifWidgetState extends State<EmailVerifWidget>{

  @override
  void initState() {
    super.initState();
    _startPeriodicEmailCheck();
  }
  

  void resendEmail() async{
    int statusCode = await resend(widget.email);
    if (statusCode==200) await successAlert("Email Verification has been resent successfully", context);
    else await warningAlert("Unexpected external error", context);
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
                padding: EdgeInsets.only(left: _screenWidth*0.26, top: 0.1*_screenHeight),
                child: Text(
                  "Confirmation",
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
                    "assets/images/cat_verif.png"
                ),
              ),
            ],
          ),
          toolbarHeight: 0.3*_screenHeight,
        ),

        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0*_screenWidth, top: 0.1*_screenHeight),
              child: Image.asset(
                "assets/images/enveloppe.png"
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.1*_screenHeight),
              child: Text(
                "Please check your Email:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lora",
                  fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.1*_screenWidth, right: 0.1*_screenWidth),
              child: Text(
                "We already have sent you verification e-mail to confirm the validity of our e-mail address. After receiving the email follow the link provided to complete your registration",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Inter",
                  color: Color(0xFF979191)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.2*_screenHeight, bottom: 0.03*_screenHeight),
              child: Container(
                height: 1,
                width: 0.8*_screenWidth,
                color: Colors.grey,
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.23*_screenWidth),
                  child: Text(
                      "Didn’t get an e-mail? ",
                    style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xFF979191),
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: InkWell(
                    onTap: resendEmail,
                    child: Padding(
                      padding: EdgeInsets.only(),
                      child: Text(
                          "Resend",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF77A9D8),
                          fontFamily: "Inter",
                          fontSize: 15
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
            //Padding(),
          ],
        ),

      ),
    );
  }

  void _startPeriodicEmailCheck(){
    Timer.periodic(Duration(seconds: 1), (Timer timer) async{
      int statusCode = await verifMail(widget.email);
      if (statusCode == 200 ) {
        timer.cancel();
        await successAlert("Account has been verified successfully", context);
        goToHome();
      }
    });
  }

}