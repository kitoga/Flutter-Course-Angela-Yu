import 'package:flutter/material.dart';
import '../constant.dart';

class IconContent extends StatelessWidget {

  IconContent({@required this.nameText, this.iconschar});

  final IconData iconschar;
  final String nameText;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconschar, size: 80.0, color: widgetColors,),
        SizedBox(height: 15,),
        Text(
          nameText,
          style: nameTextStyle,
        )
      ],
    );
  }
}