import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Login Screen"),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/login_register/bg.png"), // Replace with your own image path
                fit: BoxFit.cover,
              ),
            ),
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
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Password",
                            labelText: "Password",
                            helperText:"Password must contain special character",
                            helperStyle:TextStyle(color:Colors.green),
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
                          onPressed: () {},
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
              ],
            ),
          ),
        )
    );
  }
}
