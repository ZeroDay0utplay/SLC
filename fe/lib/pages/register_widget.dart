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
      final fname = _fnameController.text;
      final lname = _lnameController.text;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Smart Learning Cube",
                style: TextStyle(
                  fontFamily: "Goudy Old Style",
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ), // Your app title
              Image.asset(
                'assets/images/cat_signup.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ],
          ),
          toolbarHeight: 150,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12),
          
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
                        fillColor: Color(0xFFEEE5E5)
                      ),
                      onChanged: (String value){
          
                      },
                      validator: (value){
                        return value!.isEmpty ? 'Please enter email' : null;
                      },
                    ),
                  ),
          
                  SizedBox(height: 12,),
          
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _fnameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        hintText: 'Enter first name',
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        fillColor: Color(0xFFEEE5E5)
                      ),
                      onChanged: (String value){
          
                      },
                      validator: (value){
                        return value!.isEmpty ? 'Please enter the name' : null;
                      },
                    ),
                  ),
          
                  SizedBox(height: 12,),
          
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _lnameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Enter last name',
                        prefixIcon: Icon(Icons.access_time),
                        filled: true,
                        fillColor: Color(0xFFEEE5E5)
                      ),
                      onChanged: (String value){
          
                      },
                      validator: (value){
                        return value!.isEmpty ? 'Please enter the age of the child' : null;
                      },
                    ),
                  ),
          
                  SizedBox(height: 12,),
          
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
          
                  SizedBox(height: 12,),
          
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      obscureText: passwordVisible,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFEEE5E5),
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
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
          
                  SizedBox(height: 40,),
          
                  Container(
                    width: 275,
                    child: ElevatedButton(
                      onPressed: _handleRegister,
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