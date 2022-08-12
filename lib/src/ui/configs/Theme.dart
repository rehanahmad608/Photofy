/*
import 'package:flutter/material.dart';

import '../../app.dart';

final photofyPurple = Color.fromRGBO(45, 15, 101, 1);
final theme = ThemeData(
  primaryColor: themeColor,
  accentColor: Colors.grey[300],
  appBarTheme: AppBarTheme(elevation: 0),
  // fontFamily: 'Nexa',
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 90.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline3: TextStyle(
        fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline5: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
    headline6: TextStyle(fontSize: 18.0),
    bodyText1: TextStyle(fontSize: 16.0),
    bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w100),
    button: TextStyle(fontSize: 20),
  ),
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.black),
      labelStyle: TextStyle(color: themeColor),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: themeColor))),
);
*/
import 'package:flutter/material.dart';

import '../../app.dart';

final photofyPurple = Color.fromRGBO(45, 15, 101, 1);
final theme = ThemeData(
  primaryColor: Color.fromRGBO(45, 15, 101, 1),
  appBarTheme: AppBarTheme(elevation: 0),

  // fontFamily: 'Nexa',
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline3: TextStyle(
        fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline5: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
    headline6: TextStyle(fontSize: 18.0),
    bodyText1: TextStyle(fontSize: 16.0),
    bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w100),
    button: TextStyle(fontSize: 20),
  ),
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.black),
      labelStyle: TextStyle(color: themeColor),
      focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: themeColor))), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey[300]),
);
