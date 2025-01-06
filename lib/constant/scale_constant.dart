import 'package:flutter/material.dart';

class AppScale{
  double? width;
  double?height;
  AppScale(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
  
}