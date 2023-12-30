import 'package:flutter/material.dart';


class ForgotPwdWidget extends StatefulWidget{
  @override
  _ForgotPwdWidgetState createState() =>_ForgotPwdWidgetState();
}

class _ForgotPwdWidgetState extends State<ForgotPwdWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 0.08*_screenHeight),
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
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0, right: 20, top: 80),
                    child: Image.asset("assets/images/cat_login.png"),
                  ),

                  SizedBox(height: 30),

                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: _screenWidth*0.62, top: 0.1*_screenHeight),
                        child: Text(
                          "Enter your Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                              fontSize: 15
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _screenWidth*0.035),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: 'example@gmail.com',
                              suffixIcon: Icon(Icons.email),
                              border: OutlineInputBorder()
                          ),
                          onChanged: (String value){

                          },
                          validator: (value){
                            return value!.isEmpty ? 'Please enter email' : null;
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 0.1*_screenHeight,),
                  Container(
                    width: 266,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding:
                        EdgeInsets.symmetric(horizontal: 0.1*_screenWidth, vertical: 0.05*_screenHeight),
                        textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Add this line
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}