import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MagicalBall());
}

class MagicalBall extends StatelessWidget {
  const MagicalBall({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(
         backgroundColor: Colors.redAccent,
         appBar: AppBar(
           backgroundColor: Colors.red,
           title: Text(
             'Ask Me Anything!',
             style: TextStyle(
               color: Colors.white,
             ),
           ),
         ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: MagicControl(),
        ),
       ),
    );
  }
}

class MagicControl extends StatefulWidget {
  MagicControl({Key key}) : super(key: key);

  _MagicControlState createState() => _MagicControlState();
}

class _MagicControlState extends State<MagicControl> {

  int ballNumber= 2;

  @override
  Widget build(BuildContext context) {
    return Center(
       child: FlatButton(
         onPressed: (){
           setState(() {
             ballNumber = Random().nextInt(5)+ 1;
           });
         },
         child: Image.asset('images/ball$ballNumber.png')),
    );
  }
}