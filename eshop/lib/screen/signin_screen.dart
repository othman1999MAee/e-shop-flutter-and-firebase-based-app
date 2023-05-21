// import 'package:flutter/cupertino.dart';
import 'package:eshop/screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [hexStringToColor("15ed4f"), hexStringToColor("2ab2e8")],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)), // LinearGradient // BoxDecoration
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            reusableTextField("enter your username", Icons.person_outline,
                false, _emailTextController),
            SizedBox(height: 20),
            reusableTextField("enter your password", Icons.lock_outline, true,
                _passwordTextController),
            SizedBox(height: 20),
            signInSignUpButton(context, true, () {
              // FirebaseAuth.instance
              //     .signInWithEmailAndPassword(
              //         email: _emailTextController.text,
              //         password: _passwordTextController.text)
              //     .then((value) {
              //   print("User logged in");
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
              // }).catchError((error) {
              //   print("Failed to log in: $error");
              // });
            }),
            signUpOption()
          ]),
        ),
      ),
    ));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)), // Text
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ), // Text
        ) // GestureDetector
      ], // <Widget>[]
    ); // Row
  }
}
