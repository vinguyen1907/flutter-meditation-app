import 'package:flutter/material.dart';

const fontFamily = 'HelveticaNeue';

class PrimaryFont {
  static TextStyle medium(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  static TextStyle regular(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle thin(double size) {
    return TextStyle(
      fontFamily: 'HelveticaNeue',
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    );
  }
}
