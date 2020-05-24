import 'dart:ui';
import 'package:flutter/material.dart';

class Styles {
  static const String defaultFontRegular = 'Satisfy';

  static ThemeData customTheme = ThemeData(
    fontFamily: defaultFontRegular,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey[200],
    iconTheme: IconThemeData(color: Colors.blue),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.black87, fontSize: 96),
      headline2: TextStyle(color: Colors.black87, fontSize: 60),
      headline3: TextStyle(color: Colors.black87, fontSize: 50),
      headline4: TextStyle(color: Colors.black87, fontSize: 36),
      headline5: TextStyle(color: Colors.black87, fontSize: 26),
      headline6: TextStyle(color: Colors.black87, fontSize: 22),
      subtitle1: TextStyle(color: Colors.black87, fontSize: 20), //default Text
      subtitle2: TextStyle(color: Colors.black87, fontSize: 16),
      bodyText1: TextStyle(color: Colors.black87, fontSize: 18),
      bodyText2: TextStyle(color: Colors.black87, fontSize: 16),
      button: TextStyle(color: Colors.black87, fontSize: 16),
      caption: TextStyle(color: Colors.black87, fontSize: 14),
      overline: TextStyle(color: Colors.black87, fontSize: 12),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static TextStyle splashScreenText = TextStyle(
    color: Colors.white,
    fontSize: 34,
    fontFamily: defaultFontRegular,
  );
}
