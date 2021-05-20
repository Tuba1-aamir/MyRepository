import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'RatingIndicator.dart';
import 'dart:math';

void main()=> runApp(RatingApp());

class RatingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RatingPage (),
    );
  }
}

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));

    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)
    .. addListener(() {
      setState(() {
      });});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CustomPaint(
            foregroundPainter: RatingIndicator(_animation.value),
            child: Container(
              width:100,
              height:100 ,
              child: GestureDetector(
                onTap: (){
                  if( _animation.value == 100){
                    _animationController.reverse();
                    Text('5.0');
                     }
                  else{
                    _animationController.forward();
                    Text('5.0');
                       }
                      },
                child: Center(
                    child: Text('${_animation.value.toInt()}', style:TextStyle(fontSize: 50 ))
                ),
              ),
            )
          )
        ),
      )
    );
  }
}

class RatingIndicator extends CustomPainter {
  @override
  //final StrokeCircle = 11.0;
  double currentProgress ;
  RatingIndicator(this.currentProgress);

  void paint(Canvas canvas, Size size) {
    // drawing circle
    Paint circle = Paint()
      ..strokeWidth = 5
      ..color = Colors.black87
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width/2, size.height/2);//circle place,center of device
    double radius = 60; // size of circle
    canvas.drawCircle(center, radius, circle);

    //Drawing Animations
    //changing on conditions
    Paint animationArc = Paint()
      ..strokeWidth = 5
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress/100);
    //(offset center, double radius), start angle, sweep angle , use center , paint
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi/2, angle, false, animationArc);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}






