import 'package:bmi_calc/calculatorBrain.dart';
import 'package:bmi_calc/components/round_icon_button.dart';

import '../screens/result_page.dart';
import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import '../components/reuseable_card.dart';
import '../constant.dart';
import '../components/button_buttom.dart';
//Enums code here..........
enum GenderType{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  

  //-----------< enum and condition statements >------------------
  GenderType selectedGender;

  // for height of the slider
  int height = 180;

  //for weight
  int weight = 60;
  //for age
  int age = 50;
  // --------------< old code solved by enums >-------------------

  // Color maleCardColour = inActiveBoxBackground;
  // Color femaleCardColour =inActiveBoxBackground;

  // void updateColor(GenderType selectedGender){
  //   if (selectedGender == GenderType.male) {
  //     if(maleCardColour == inActiveBoxBackground){
  //       maleCardColour = boxBackground;
  //       femaleCardColour = inActiveBoxBackground;
  //     }else{
  //       maleCardColour = inActiveBoxBackground;
  //     }
  //   }

  //   if (selectedGender == GenderType.female) {
  //     if(femaleCardColour == inActiveBoxBackground){
  //       femaleCardColour = boxBackground;
  //       maleCardColour = inActiveBoxBackground;
  //     }else{
  //       femaleCardColour = inActiveBoxBackground;
  //     }
  //   }
    
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onpress: (){
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    //Use of Ternary Operators (condition statement)
                    colour: selectedGender == GenderType.male? boxBackground : inActiveBoxBackground,
                    cardChild: IconContent(
                      iconschar: Icons.book_online_outlined,
                      nameText: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onpress: (){
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: selectedGender == GenderType.female ? boxBackground: inActiveBoxBackground,
                    cardChild: IconContent(
                      iconschar: Icons.book_online_rounded,
                      nameText: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: boxBackground,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: nameTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    //textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBigNumbers,
                      ),
                      Text(
                        'cm',
                        style: nameTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Color(0xff8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0xffffb6c1),
                      thumbShape: 
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: 
                        RoundSliderThumbShape(enabledThumbRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 120,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: boxBackground,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: nameTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressButton: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressButton: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: boxBackground,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: nameTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressButton: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressButton: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            route: (){
              //Data from the CalculatorBrain class were passed to the ResultPage()
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              //Data has been passed down to the next page which is the ResultPage
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultPage(

                //thats why you can use the properties or function from the CalculateBrain Class and..
                //use in the ResultPage()
                calculateResult: calc.calculateResult(),
                getMessage: calc.getMessage(),
                getResult: calc.getResult(),
              )));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      )
    );
  }
}

