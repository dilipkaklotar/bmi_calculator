import 'package:flutter/material.dart';
import 'package:bmi_calculator/screen/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xffFFFFFF),
        accentColor: Color(0xff5F47E1),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

