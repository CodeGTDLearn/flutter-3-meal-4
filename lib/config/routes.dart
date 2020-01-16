import 'package:flutter/material.dart';

import '../entity/meal.dart';
import '../views/category_meals.dart';
import '../views/meals_details.dart';
import '../views/tabs.dart';

class Routes {
  //type here your routes
  static final String _tabs = "/";
  static final String _categoryMeals = "/category-meals";
  static final String _mealsDetails = "/meal-details";
  static final String _filters = "/meal-filters";

  final List<Meal> _displayedMeals;

  Routes(this._displayedMeals);

  Map<String, WidgetBuilder> toScreens() {
    return {
      _tabs: (context) => ViewTabs(),
      _categoryMeals: (context) => ViewCategoryMeals(this._displayedMeals),
      _mealsDetails: (context) => ViewMealsDetails(),
      _filters: (context) => ViewMealsDetails(),
    };
  }

  static String get toScreenTabs => _tabs;

  static String get toScreenCategoryMeals => _categoryMeals;

  static String get toScreenMealsDetails => _mealsDetails;

  static String get toScreenFilters => _filters;
}
