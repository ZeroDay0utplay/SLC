import 'package:flutter/material.dart';
import '../pages/register_widget.dart';
import '../pages/login_widget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  void initState() {
    super.initState();
  }

  void onGetStarted() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterWidget()),
    );
  }

  void onSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Join us today',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: MaterialButton(
                    onPressed: onGetStarted,
                    child: Text('Get Started'),
                    color: Colors.teal,
                    textColor: Colors.white,
                    height: 40,
                    minWidth: double.infinity,
                  ),
                ),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: MaterialButton(
                    onPressed: onSignIn,
                    child: Text('Sign In'),
                    color: Colors.teal,
                    textColor: Colors.white,
                    height: 40,
                    minWidth: double.infinity,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}