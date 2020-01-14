import 'package:flutter/material.dart';

class AppTheme {
  //USING SINGLETON PATTERN: NO MORE THAN ONE INSTANCE IS NECESSARY
  static AppTheme _instance;


  AppTheme._internalConstructor();

  factory AppTheme() {
    _instance ??= AppTheme._internalConstructor();
    return _instance;
  }

  static final ThemeData _themeConfiguration = ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.amber,
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData
        .light()
        .textTheme
        .copyWith(
      body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
      body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
      title: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
    ),
  );

  ThemeData get themeData => _themeConfiguration;
}
