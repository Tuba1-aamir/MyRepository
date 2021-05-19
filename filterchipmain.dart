import 'package:flutter/material.dart';
import 'FilterChipDisplay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chips',
      theme: ThemeData(
        //primaryColor: new Color(0xffe91e63),
        //primaryColor: new Color(0xffffc107),
        primaryColor: new Color(0xff6200ee),
        //primaryColor: new Color(0xffF2601F),
      ),
      home: FilterChipDisplay(),//filterchip

    );
  }
}