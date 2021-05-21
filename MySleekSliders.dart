/*import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main()=> runApp(MySleekSliders());


class MySleekSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SleekSlider(),
    );
  }
}


class SleekSlider extends StatelessWidget {

  Widget slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(),
    initialValue: 25,
    onChange: (double value){
      print(value);
    },
  );

  Widget slider1 = SleekCircularSlider(
    appearance: CircularSliderAppearance(
      customColors: CustomSliderColors(trackColor: Colors.limeAccent,progressBarColors:
      [Colors.lightGreen, Colors.amberAccent],shadowMaxOpacity: 20.0),
      infoProperties: InfoProperties(topLabelText: 'Running..'),
    ),
    initialValue: 60,
    onChange: (double value){
      print(value);
    },
  );

  Widget slider2 = SleekCircularSlider(
    appearance: CircularSliderAppearance(
      spinnerMode: true,
      size: 50.0,
      customWidths: CustomSliderWidths(trackWidth: 10.0,shadowWidth: 5.0),
    ),
    initialValue: 90,
    onChange: (double value){
      print(value);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleek Slider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            slider,
            SizedBox(height: 5),
            slider1,
            SizedBox(height: 5,),
            slider2 */

          //],
      //  ),
     // ),
  //  );
 // }
//}
