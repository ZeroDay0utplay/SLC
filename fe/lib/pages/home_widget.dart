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
          appBar: AppBar(
            title: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Smart Learning Cube",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Goudy Old Style',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50.0, right: 20),
                    child: Image.asset("assets/images/cat_getStarted.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 50.0, bottom: 40.0),
                    child: Text(
                      "Track your child's progress effortlessly with our user-friendly app",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Color(0xFF979191)),
                    ),
                  ),
                  Container(
                    width: 266,
                    child: ElevatedButton(
                      onPressed: onGetStarted,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding:
                            EdgeInsets.symmetric(horizontal: 65, vertical: 20),
                        textStyle: TextStyle(fontSize: 25, fontFamily: 'Kavoon'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Add this line
                        ),
                      ),
                      child: Text(
                        'Get started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 266,
                    child: ElevatedButton(
                      onPressed: onSignIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF5F5F5),
                        padding:
                        EdgeInsets.symmetric(horizontal: 65, vertical: 20),
                        textStyle: TextStyle(fontSize: 25, fontFamily: 'Kavoon'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Add this line
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
