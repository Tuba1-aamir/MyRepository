import 'package:flutter/material.dart';
       //6(3a)
class MenuItem extends StatelessWidget {
  //properties of mey item
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.cyan,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 26, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}