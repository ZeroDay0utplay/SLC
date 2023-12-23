import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'login.dart';
import 'learn.dart';
import 'auth.dart';
import 'test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  void _handleLogin() async{
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold
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
                      border: OutlineInputBorder(),
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
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: MaterialButton(
                    onPressed: _handleLogin,
                    child: Text('Sign in'),
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