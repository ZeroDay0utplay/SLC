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
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
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
      final name = _nameController.text;
      final age = _ageController.text;
      int statusCode = await register(email, password, name, age);
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
        body: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Create an account',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold
                  ),
                ),

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
                      border: OutlineInputBorder(),
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
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
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
                    controller: _ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      hintText: 'Enter age',
                      prefixIcon: Icon(Icons.access_time),
                      border: OutlineInputBorder(),
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
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(),
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
                      filled: true,
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: MaterialButton(
                    onPressed: _handleRegister,
                    child: Text('SIGN UP'),
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