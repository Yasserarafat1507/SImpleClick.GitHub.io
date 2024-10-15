import "package:flutter/material.dart";

class SizedConfig {
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static Orientation orientation =Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData =  MediaQuery.of(context);
    screenHeight =  _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation =  _mediaQueryData.orientation;
  }
}

double getPropScreenWidth(double size) {
  double screenWidth = SizedConfig.screenWidth;
  // retrun ukuran screen hp
  return  (size / 375.0) * screenWidth;
}

double getPropScreenHeight(double size) {
  double screenHeight = SizedConfig.screenHeight;
  // retrun ukuran screen hp
  return  (size / 812.0) * screenHeight;
}