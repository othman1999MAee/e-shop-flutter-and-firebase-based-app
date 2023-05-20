import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUpScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

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
            //logoWidget("assets/images/img3.png"),
            SizedBox(height: 30),
            reusableTextField("enter your username", Icons.person_outline,
                false, _userNameTextController),
            SizedBox(height: 30),
            reusableTextField("enter your email", Icons.person_outline, false,
                _emailTextController),
            SizedBox(height: 20),
            reusableTextField("enter your password", Icons.lock_outline, true,
                _passwordTextController),
            SizedBox(height: 20),
            signInSignUpButton(context, false, () {
              // FirebaseAuth.instance
              //     .createUserWithEmailAndPassword(
              //         email: _emailTextController.text,
              //         password: _passwordTextController.text)
              //     .then((value) {
              // print("User created");
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
              // }).onError((error, stackTrace) {
              //   print("error ${error.toString()}");
              // });
            }),
          ]),
        ),
      ),
    ));
  }
}
