import 'package:flutter/material.dart';
import 'package:meal_4/views/filters.dart';

import '../views/category_meals.dart';
import '../views/meals_details.dart';
import '../views/tabs.dart';

class Routes {
  static final String _tabs = '/';
  static final String _categoryMeals = '/category-meals';
  static final String _mealsDetails = '/meal-details';
  static final String _filters = '/filters';

  Map<String, WidgetBuilder> toViews() {
    return {
      _tabs: (context) => ViewTabs(),
      _categoryMeals: (context) => ViewCategoryMeals(),
      _mealsDetails: (context) => ViewMealsDetails(),
      _filters: (context) => ViewFilters(),
    };
  }

  static String get toViewTabs => _tabs;

  static String get toViewCategoryMeals => _categoryMeals;

  static String get toViewMealsDetails => _mealsDetails;

  static String get toViewFilters => _filters;
}
