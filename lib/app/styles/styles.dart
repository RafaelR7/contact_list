import 'dart:ui';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData lightThemeData = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey[200],
    iconTheme: IconThemeData(color: Colors.blue),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.black87, fontSize: 96),
      headline2: TextStyle(color: Colors.black87, fontSize: 60),
      headline3: TextStyle(color: Colors.black87, fontSize: 48),
      headline4: TextStyle(color: Colors.black87, fontSize: 34),
      headline5: TextStyle(color: Colors.black87, fontSize: 24),
      headline6: TextStyle(color: Colors.black87, fontSize: 20),
      subtitle1: TextStyle(color: Colors.black87, fontSize: 20), //default Text
      subtitle2: TextStyle(color: Colors.black87, fontSize: 14),
      bodyText1: TextStyle(color: Colors.black87, fontSize: 16),
      bodyText2: TextStyle(color: Colors.black87, fontSize: 14),
      button: TextStyle(color: Colors.black87, fontSize: 14),
      caption: TextStyle(color: Colors.black87, fontSize: 12),
      overline: TextStyle(color: Colors.black87, fontSize: 10),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
