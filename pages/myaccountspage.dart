

import 'package:flutter/material.dart';
import 'package:wehire/bloc/navigation_bloc/navigation_bloc.dart';

import '../MySleekSliders.dart';

                    //5
class MyAccountsPage extends StatelessWidget with NavigationStates {

  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Rating",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28 , color: Color(0x42000000)),
      ),
    );
  }
}
