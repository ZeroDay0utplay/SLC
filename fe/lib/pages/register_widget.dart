import 'package:fe/pages/login_widget.dart';
import 'package:flutter/material.dart';
import '../routes/register.route.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  void goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginWidget()),
    );
  }

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleRegister() async{
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final confirm_pwd = _confirmpasswordController.text;
      final fname = _fnameController.text;
      final lname = _lnameController.text;
      if (password != confirm_pwd){
        showErrorDialog("Passwords do not match");
        return;
      }
      int statusCode = await register(email, password, fname, lname);
      switch (statusCode){
        case 200: goToLogin();
        case 408: showErrorDialog("Invalid email address");
        case 411: showErrorDialog("User already exists");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: _screenHeight*0.05, top: _screenHeight*0.1, bottom: 0),
                            child: Text(
                              "Smart Learning Cube",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Goudy Old Style',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: _screenWidth*0.325, top: _screenHeight*0.23, bottom: 0),
                            child: Text(
                              "First Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _screenHeight*0.12, top: _screenHeight*0.17),
                        child: Image.asset("assets/images/cat_signup.png"),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenWidth*0.035),
                    child: Container(
                      height: _screenHeight*0.14,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _fnameController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value){

                        },
                        validator: (value){
                          return value!.isEmpty ? 'Please enter the name' : null;
                        },
                      ),
                    )
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: EdgeInsets.only(right: _screenWidth*0.72),
                    child: Text(
                      "Last Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 15
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenHeight*0.035),
                    child: Container(
                      height: _screenHeight*0.14,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _lnameController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.perm_contact_cal_rounded),
                            border: OutlineInputBorder()
                        ),
                        onChanged: (String value){

                        },
                        validator: (value){
                          return value!.isEmpty ? 'Please enter the age of the child' : null;
                        },
                      ),
                    )
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: EdgeInsets.only(right: _screenWidth*0.82),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 15
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenHeight*0.035),
                    child: Container(
                      height: _screenHeight*0.14,
                      child: TextFormField(
                        style: TextStyle(
                          shadows: <Shadow>[],
                        ),
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
                    )
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: EdgeInsets.only(right: _screenWidth*0.74),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 15
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenHeight*0.035),
                    child: Container(
                      height: _screenHeight*0.14,
                      child: TextFormField(
                        obscureText: passwordVisible,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //helperText:"Password must contain special character",
                          //helperStyle:TextStyle(color:Colors.teal),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                    () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          alignLabelWithHint: false,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (String value){

                        },
                        validator: (value){
                          return value!.isEmpty ? 'Please enter password' : null;
                        },
                      ),
                    )
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: EdgeInsets.only(right: _screenWidth*0.58),
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 15
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenHeight*0.035),
                    child: Container(
                      height: _screenHeight*0.14,
                      child: TextFormField(
                        obscureText: passwordVisible,
                        controller: _confirmpasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //helperText:"Password must contain special character",
                          //helperStyle:TextStyle(color:Colors.teal),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                    () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          alignLabelWithHint: false,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (String value){

                        },
                        validator: (value){
                          return value!.isEmpty ? 'Please confirm password' : null;
                        },
                      ),
                    )
                  ),

                  SizedBox(height: 30,),

                  Container(
                    width: _screenWidth*0.7,
                    child: ElevatedButton(
                      onPressed: _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding:
                        EdgeInsets.symmetric(horizontal: _screenWidth*0.1, vertical: _screenHeight*0.04),
                        textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Add this line
                        ),
                      ),
                      child: Text(
                        'Sign up',
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