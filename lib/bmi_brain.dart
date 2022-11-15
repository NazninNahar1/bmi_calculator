import 'dart:math';


class BmiBrain {

  double height;
  double weight;
  late double _bmi;


  BmiBrain({required this.height,required this.weight});

  String bmiCalculate(){

     _bmi = weight/pow(height/100, 2);


    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return "Overweight";
    }
    if(_bmi>=18.5){
      return 'Normal';
    }
    else {
      return 'Under Weight';
    }
  }

  String getInterPretation(){
    if(_bmi>=25){
      return "Eat less, do Exercise Regularly";
    }
    if(_bmi>=18.5){
      return 'Your weight is completely fine.Maintain your healthy body!l';
    }
    else {
      return 'Eat more';
    }
  }

}

