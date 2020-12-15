import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'Dice',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  DicePage({Key key}) : super(key: key);

  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

// firstly initailize the number and then add to the image using $leftdice or $rightdice
  int leftdiceNumber = 1;
  int rightdiceNumber = 1;

// given a void name a value or values to stop repeated codes
  void DiceNumbers(){
    setState(() {
      rightdiceNumber = Random().nextInt(6) + 1;
      leftdiceNumber = Random().nextInt(6) + 1;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Center(
       child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: (){
                setState(() {
                  DiceNumbers();
                });
              },
              child: Image.asset('images/dice$leftdiceNumber.png'))),
          Expanded(
            child: FlatButton(
              onPressed: (){
                setState(() {
                  DiceNumbers();
                });
              },
              child: Image.asset('images/dice$rightdiceNumber.png'))),
        ],
         ),
    );
  }
}