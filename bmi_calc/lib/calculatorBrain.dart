import 'dart:math';

class CalculatorBrain {

  int height;
  int weight;
  
  CalculatorBrain({this.height, this.weight});

  double _bmi;

  String calculateResult(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 21){
      return 'OverWeight';
    }else if(_bmi > 18){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }

  String getMessage(){
    if(_bmi >= 21){
      return 'You have a higher than normal body weight.Try and exercise more';
    }else if(_bmi > 18){
      return 'You have normal body weight. Good Job';
    }else{
      return 'You have Lower than normal body weight. Eat a bit more!';
    }
  }

}