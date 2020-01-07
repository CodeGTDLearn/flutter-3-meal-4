import 'package:flutter/material.dart';
import 'package:meal_4/entity/meal.dart';
import 'package:meal_4/screens/tabs.dart';

class Routes {
  static final String _toScreenTabs = "/";
  static final String _toScreenCategoryMeals = "/category-meals";

  List<Meal> _favoriteMeals;
  List<Meal> _displayedMeals;

  Routes(this._favoriteMeals, this._displayedMeals);

  Map<String, WidgetBuilder> toScreens() {
    return {
      _toScreenTabs: (context) => ScreenTabs(this._favoriteMeals),
      //_toScreenCategoryMeals: (context) => ScreenCategoryMeals(this._displayedMeals),
    };
  }

  static String get toScreenTabs => _toScreenTabs;
}
