import 'dart:math';

import 'package:eshop/screen/home_screen.dart';
import 'package:eshop/screen/signin_screen.dart';
import 'package:eshop/screen/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //,ake a try catch block

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyCMrturjmrtaKSVNxsE1MgYNsIjAO47MnQ",
    authDomain: "eshop-1e1e8.firebaseapp.com",
    projectId: "e-shop-5bda3",
    storageBucket: "e-shop-5bda3.appspot.com",
    messagingSenderId: "80295093098",
    appId: "1:80295093098:android:0b104a3739e61f5f847b13",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eshop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
