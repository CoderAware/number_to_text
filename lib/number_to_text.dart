library number_to_text;

import 'package:flutter/material.dart';
import 'package:number_to_text/number_watching.dart';

class NumberToText{
  static final NumberToText _instance = NumberToText._convert();
  NumberToText._convert();

 factory NumberToText()=>_instance; 
  String convert({@required double value}){
    if(value>0){
       return numberWatching(value);

    }
    else return 'ZERO';
  

  }
}