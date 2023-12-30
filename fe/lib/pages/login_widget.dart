import 'package:fe/pages/hello_widget.dart';
import 'package:flutter/material.dart';
import '../routes/login.route.dart';
import '../middlewares/alerts.dart';
import 'forgot_password_widget.dart';
import '../pages/email_verif_widget.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  void goToHello() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelloWidget()),
    );
  }

  void goToConfirmEmail(String email){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmailVerifWidget(email: email,)),
    );
  }



  void _handleLogin() async{
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      int statusCode = await login(email, password);
      switch (statusCode){
        case 200:
          await successAlert("Login successfully", context);
          goToHello();
        case 400:
          await warningAlert("User not found", context); // That's it to display an alert, use other properties to customize.
        case 407:
          await errorAlert("Wrong password", context);
        case 411 :
          await errorAlert("Please confirm your account", context);
          goToConfirmEmail(email);
      }
    }
  }

  void onForgotPwd(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPwdWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "Smart Learning Cube",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Goudy Old Style',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10
                    ),
                    child: Text(
                      "See your child's skills blossom with the assistance of our innovative toy",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Color(0xFF979191)),
                    ),
                  ),
          
                  SizedBox(height: 30),
          
                  Column(
                    children: [
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
          
                  SizedBox(height: 30,),
          
                  Column(
                    children: [
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
                        padding: EdgeInsets.symmetric(horizontal: _screenWidth*0.035),
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
                      ),
                    ],
                  ),
          
                  Padding(
                    padding: EdgeInsets.only(top: _screenHeight*0.01, left: _screenWidth*0.5),
                    child: InkWell(
                      onTap: onForgotPwd,
                      child: Text(
                        'you forgot your password?',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'Goudy Old Style',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
          
                  SizedBox(height: 30,),
                  Container(
                    width: 266,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding:
                        EdgeInsets.symmetric(horizontal: 65, vertical: 20),
                        textStyle: TextStyle(fontSize: 20, fontFamily: 'Kavoon'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Add this line
                        ),
                      ),
                      child: Text(
                        'Login',
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