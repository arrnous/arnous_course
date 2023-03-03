import 'package:flutter/material.dart';
import 'package:flutter_course/login&register/Login.dart';

void main() async {
  //prefs.reload();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Login(),
      //routes: {"Home": (context) => HomePage2()},
    );
  }
}
