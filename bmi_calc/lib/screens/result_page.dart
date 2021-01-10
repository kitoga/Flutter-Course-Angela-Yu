import '../components/reuseable_card.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../components/button_buttom.dart';

class ResultPage extends StatelessWidget {

  // Because we want to use the functions here in the result page 
  //so we have to initialize or create a constructor for the properties of the CalculateBrain Class
  ResultPage({@required this.calculateResult, @required this.getResult, @required this.getMessage});

  final String calculateResult;
  final String getResult;
  final String getMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('BMI Calculator'),
       ),
       body:Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         //to strech the box to the end and not take up the weight of the text OVerweight
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                 'Your Results', 
                 style: kLargeResultText,
              )),
           ),
           Expanded(
             flex: 5,
             child: ReuseableCard(
               colour: boxBackground,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                     getResult,
                     style: kResultText,
                   ),
                   Text(calculateResult,
                   style: kResultTextBold,
                   ),
                   Text(
                     getMessage,
                     textAlign: TextAlign.center,
                     style: kResultTextStyle,
                   )
                 ],
               ),
             ),
           ),
           BottomButton(
             // To go back to the input page
            route: ()=> Navigator.pop(context),
            buttonTitle: 'RE-CALCULATE',
           )
         ],
       )
    );
  }
}
  