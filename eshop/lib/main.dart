import 'dart:math';

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
          apiKey: "AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY",
          authDomain: "eshop-1e1e8.firebaseapp.com",
          projectId: "eshop-1e1e8",
          storageBucket: "eshop-1e1e8.appspot.com",
          messagingSenderId: "1059020180980",
          appId: "1:1059020180980:web:6b6b0b0b0b0b0b0b0b0b0b",
          measurementId: "G-0ZQZQZQZQZQZQZQZQZQZQZ"));

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
      home: const SignInScreen(),
    );
  }
}
