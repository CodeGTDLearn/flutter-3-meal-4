import 'package:flutter/material.dart';

import '../entity/meal.dart';
import '../screens/category_meals.dart';
import '../screens/meals_details.dart';
import '../screens/tabs.dart';

class Routes {
  //type here your routes
  static final String _tabs = "/";
  static final String _categoryMeals = "/category-meals";
  static final String _mealsDetails = "/meal-details";

  final List<Meal> _displayedMeals;

  Routes(this._displayedMeals);

  Map<String, WidgetBuilder> toScreens() {
    return {
      _tabs: (context) => ScreenTabs(),
      _categoryMeals: (context) => ScreenCategoryMeals(this._displayedMeals),
      _mealsDetails: (context) => MealsDetails(),
    };
  }

  static String get toScreenTabs => _tabs;

  static String get toScreenCategoryMeals => _categoryMeals;

  static String get toScreenMealsDetails => _mealsDetails;
}
