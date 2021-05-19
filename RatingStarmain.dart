import 'package:flutter/material.dart';
//import 'RatingUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(RatingAppUI());

class RatingAppUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RatingUI(),
    );
  }
}


class RatingUI extends StatelessWidget {
  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating UI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Rating...',style: TextStyle(fontSize: 30.0),),
            RatingBar(
              itemCount: 5,
              initialRating: 3,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemBuilder: (context, _)=> Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating){
                print(rating);
                },
            ),
            Text('Hurry!')
          ],
        ),
      ),
    );
  }}

