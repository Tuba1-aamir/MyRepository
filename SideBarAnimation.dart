import 'package:flutter/material.dart';
import 'package:wehire/sidebar/sidebar_layout.dart';

         //MAIN PAGE
         //1
void main() => runApp(SideDrawer());

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF004D40),
          primaryColor:Color(0xFF004D40),
      ),
      home: SideBarLayout(), //sidebar (package)
    );
  }
}