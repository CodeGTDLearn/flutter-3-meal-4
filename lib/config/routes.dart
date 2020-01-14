import 'package:flutter/material.dart';
import 'package:meal_4/entity/meal.dart';
import 'package:meal_4/screens/category_meals.dart';
import 'package:meal_4/screens/tabs.dart';

class Routes {
  //type here your routes
  static final String _tabs = "/";
  static final String _categoryMeals = "/category-meals";
  static final String _mealsDetails = "/meal-details";

  final List<Meal> _favoriteMeals;
  final List<Meal> _displayedMeals;

  Routes(this._favoriteMeals, this._displayedMeals);

  Map<String, WidgetBuilder> toScreens() {
    return {
      _tabs: (context) => ScreenTabs(this._favoriteMeals),
      _categoryMeals: (context) => ScreenCategoryMeals(this._displayedMeals),

    };
  }

  static String get toScreenTabs => _tabs;

  static String get toScreenCategoryMeals => _categoryMeals;

  static String get toScreenMealsDetails => _mealsDetails;
}
