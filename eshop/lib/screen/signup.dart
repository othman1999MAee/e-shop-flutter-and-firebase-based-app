// this is a signup page
//lets start
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

// create a signup class with nice stateless widget
// check if the password is == confirm password
// if not show a error message while the user is typing in red color
// if the password is == confirm password show a success message in green color
// check if the email ends with @gmail.com
// if not show a error message while the user is typing in red color

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // create a appbar
      appBar: AppBar(
        title: const Text("Signup"),
        backgroundColor: Colors.red,
      ),
      // create a body
      body: Center(
        child: Column(
          children: [
            // create a textfield for email
            TextField(
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            // create a textfield for password
            TextField(
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            // create a textfield for confirm password
            TextField(
              decoration: const InputDecoration(
                hintText: "Confirm Password",
              ),
            ),
            // create a button for signup
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: const Text("Signin"),
            ),
          ],
        ),
      ),
    );
  }
}
