import 'package:flutter/material.dart';

  abstract class Kstyles {

    
  static const     FontWeight kFontWeight = FontWeight.bold;


    static   TextStyle kTextStyle (  double   fontSize){
    return  TextStyle(fontSize:  fontSize,fontWeight: kFontWeight);
  }
  }
