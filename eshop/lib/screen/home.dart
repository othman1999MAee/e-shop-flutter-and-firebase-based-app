// create a home page contane a logout button
// create a logout button
// when the user click on the logout button
// the user will be redirected to the signin page
import 'package:eshop/screen/singnin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  // create a logout button
  // when the user click on the logout button
  // the user will be redirected to the signin page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // create a appbar
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.red,
      ),
      // create a body
      body: Center(
        child: Column(
          children: [
            // create a button for logout
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
