
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wehire/sidebar/sidebar.dart';

import 'package:wehire/sidebar/sidebar_layout.dart';

import 'sidebar/sidebar_layout.dart';


void main()=> runApp(MaterialApp(home: Home(),));
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _widgetOptions = <Widget>[
    SideBarLayout(),
    //SideBar(),// this page implements the drawer
  ];


  int _currentSelected = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void _onItemTapped(int index) {
    index == 3
        ? _drawerKey.currentState.openDrawer()
        : setState(() {
      _currentSelected = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentSelected),
      key: _drawerKey,
      drawer: Drawer();
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _currentSelected,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[800],
        selectedItemColor: Color.fromRGBO(10, 135, 255, 1),
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.apps),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
           label:'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'profile',
          )
        ],
      ),
      // backgroundColor: Colors.black,
    );
  }
}

