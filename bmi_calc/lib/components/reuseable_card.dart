import 'package:flutter/material.dart';
import 'dart:ui';


class ReuseableCard extends StatelessWidget {
  
  ReuseableCard({@required this.colour, this.cardChild, this.onpress});
  //how to use final in your flutter code, colour will be given a value 
  final Color colour;
  final Widget cardChild;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}