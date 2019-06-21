import 'package:flutter/material.dart';

class HiddenScrollBehavior extends ScrollBehavior{
@override
Widget buildViewportChrome(BuildContext context, Widget child , AxisDirection axisDirector){

  return child;
  
  }

}