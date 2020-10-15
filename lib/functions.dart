
import 'dart:math';

import 'package:flutter/material.dart';
class Bmi_calc {
  Bmi_calc({this.hight,this.weight ,this.gender});

  final hight ;
  final weight ;
  final int gender;
  double _bmi ;

  double get bmi => _bmi;

  set bmi(double bmi) {
    _bmi = bmi;
  }


  String bmicalc() {
  
    if (gender==1)
      bmi = weight / pow(hight/100, 2) ;
      else 
      bmi = (weight-10) / pow(hight/100, 2) ;
    
    
    
    
  
return bmi.toStringAsFixed(1);

  }
  Color whatcolor()
  {
    if (bmi>=25){
      return Colors.red;
    }
    else if (bmi>=18.5){
      return Colors.green;
    }
    else{
      return Colors.yellow;
     
  }
  
  
  }

  String whatbody()
  {
    if (bmi>=25){
      return "overweight";
    }
    else if (bmi>=18.5){
      return "normal";
    }
    else{
      return "underweight";
     
  }
  }
   String whatadvice()
  {
    if (bmi>=25){
      return "you have a higher than normal body weight. tru to exercise more. ";
    }
    else if (bmi>=18.5){
      return "you have agood body weight . good job!";
    }
    else{
      return "you have a lower than normal body weight . you should eat more";
     
  }
  }
}