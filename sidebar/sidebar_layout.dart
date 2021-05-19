import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wehire/bloc/navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';

          //MAIN SIDEBAR CODE
          //2
class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        //A Stack having chidren,Sidebar and all pages over it
        child: Stack(
          children: <Widget>[
              //code for navigation between the Pages(their dashboard)   //**THE BASE LAYER**//
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget; // whatever state will be ,it will be store in navigationState
              },
            ),
            SideBar(),      //sidebar(inside sidebar page)  //**THE TOP LAYER**//
          ],
        ),
      ),
    );
  }
}