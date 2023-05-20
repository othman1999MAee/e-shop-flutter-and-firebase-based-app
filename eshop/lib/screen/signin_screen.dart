// import 'package:flutter/cupertino.dart';
import 'package:eshop/screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

// import 'home.dart';

// class Signin extends StatelessWidget {
//   const Signin({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // create a appbar
//       appBar: AppBar(
//         title: const Text("Signin"),
//         // gradient color
//         backgroundColor: Colors.red,
//       ),
//       // create a body
//       body: Center(
//         child: Column(
//           children: [
//             // create a textfield for email
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: "Email",
//               ),
//             ),
//             // create a textfield for password
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: "Password",
//               ),
//             ),
//             // create a button for signin
//             // when the user click on the signin button the user will be redirected to the home page
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Home()),
//                 );
//               },
//               child: const Text("Signin"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
              colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)), // LinearGradient // BoxDecoration
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            //  logoWidget("assets/images/img3.png"),
            SizedBox(height: 30),
            reusableTextField("enter your username", Icons.person_outline,
                false, _emailTextController),
            SizedBox(height: 20),
            reusableTextField("enter your password", Icons.lock_outline, true,
                _passwordTextController),
            SizedBox(height: 20),
            signInSignUpButton(context, true, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                print("User logged in");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }).catchError((error) {
                print("Failed to log in: $error");
              });
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
