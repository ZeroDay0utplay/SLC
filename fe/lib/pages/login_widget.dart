import 'package:fe/pages/home_widget.dart';
import 'package:flutter/material.dart';
import '../routes/login.route.dart';

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

  void _handleLogin() async{
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      int statusCode = await login(email, password);
      switch (statusCode){
        case 200: goToHello();
        case 400: showErrorDialog("User does not exist");
        case 407: showErrorDialog("Wrong password");
      }
    }
  }

  void onForgotPwd(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelloWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter mail',
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        fillColor: Color(0xFFEEE5E5),
                      ),
                      onChanged: (String value){
          
                      },
                      validator: (value){
                        return value!.isEmpty ? 'Please enter email' : null;
                      },
                    ),
                  ),
          
                  SizedBox(height: 30,),
          
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      obscureText: passwordVisible,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFEEE5E5),
                        hintText: "Password",
                        labelText: "Password",
                        //helperText:"Password must contain special character",
                        //helperStyle:TextStyle(color:Colors.teal),
                        prefixIcon: Icon(Icons.lock),
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
          
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 150, bottom: 0),
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