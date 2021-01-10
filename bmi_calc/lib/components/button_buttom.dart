import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  
  BottomButton({@required this.buttonTitle, @required this.route});
  final String buttonTitle;
  final Function route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        height: buttomContainerHeight,
        width: double.infinity,
        color: buttomContainercolor,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Center(
            child: Text(buttonTitle, 
              style: kLargeTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
