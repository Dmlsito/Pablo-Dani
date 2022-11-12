// import 'package:mysql1/mysql1.dart';

import 'package:flutter/material.dart';

import 'clicker.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clicker",
      initialRoute: "/Login",
      routes: {
        "/Clicker": (BuildContext context) => ClickerMain(),
        "/Login": (BuildContext context) => LoginStates(),
      },
    );
  }
}
