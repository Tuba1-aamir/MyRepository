import 'package:flutter/material.dart';
import 'package:wehire/bloc/navigation_bloc/navigation_bloc.dart';

               //6
class MyOrdersPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Active orders",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28 , color: Color(0x42000000)),
      ),
    );
  }
}