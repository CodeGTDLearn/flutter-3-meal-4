import 'package:flutter/material.dart';
import 'package:meal_4/entity/meal.dart';
import 'package:meal_4/screens/screen_tabs.dart';

class Routes {
  static final String _toScreenTabs = "/";

  List<Meal> _favoriteMeals;

  Routes(this._favoriteMeals);

  Map<String, WidgetBuilder> toScreens() {
    return {_toScreenTabs: (context) => ScreenTabs(this._favoriteMeals)};
  }

  static String get toScreenTabs=> _toScreenTabs;

}
