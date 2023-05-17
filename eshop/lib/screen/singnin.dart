// creation a nice screen for the user to sign in
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // create a appbar
      appBar: AppBar(
        title: const Text("Signin"),
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
            // create a button for signin
            // when the user click on the signin button the user will be redirected to the home page
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
