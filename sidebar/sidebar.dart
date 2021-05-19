import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wehire/bloc/navigation_bloc/navigation_bloc.dart';
import '../MySleekSliders.dart';
import '../Ratingmain.dart';
import '../sidebar/menu_item.dart';

                        //3
class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed; //animation completed mean sidebar Open

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;   //variable for screenwidth

    return StreamBuilder<bool>(
      initialData: false, //initially its closed so false
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,    // State of sidebar
          bottom: 0,  //State of sidebar
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,  // open/close condition of sidebar
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45, // open/close condition of sidebar
          child: Row(  //row widget,as our sidebar will expand in row form
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20), //left padding
                  color: const Color(0x42000000),//color of sidebar
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      // PROFILE SECTION
                      ListTile(
                        title: Text(
                          "Profile",
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        subtitle:SafeArea(
                          left: false,
                          top: false,
                          right: true,
                          bottom: false,
                         child:  Text(
                           "www.myemailname.com",
                            style: TextStyle(color: Color(0xFF1BB5FD), fontSize: 16,
                            ),
                          ),
                        ),

                        leading: CircleAvatar(

                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.monetization_on_outlined,
                        title: "My Earnings",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.star_rate_rounded,
                        title: "Ratings",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RatingApp()));
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "Active Orders",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(  //side TapOn widget
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                /*  child: ClipPath(
                    clipper: CustomMenuClipper(), */
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              //),
            ],
          ),
        );
      },
    );
  }
}

 /*class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }
  }*/

