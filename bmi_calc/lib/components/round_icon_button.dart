import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressButton});
  final IconData icon;
  final Function onPressButton;
  
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressButton,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      child: Icon(icon, color: Colors.white,), 
    );
  }
}