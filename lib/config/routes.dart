import 'package:flutter/material.dart';

import '../utils/parseYaml.dart';
import '../views/category_meals.dart';
import '../views/filters.dart';
import '../views/meals_details.dart';
import '../views/tabs.dart';

class Routes {
  static final String _viewTabs = '/';
  static final String _viewCategoryMeals = '/category-meals';
  static final String _viewMealsDetails = '/meal-details';
  static final String _viewFilters = '/filters';
  static ParseYaml cfg;

  Routes() {
  }

  Map<String, WidgetBuilder> toViews() {
    return {
      _viewTabs: (context) => ViewTabs(),
      _viewCategoryMeals: (context) => ViewCategoryMeals(),
      _viewMealsDetails: (context) => ViewMealsDetails(),
      _viewFilters: (context) => ViewFilters(),
    };
  }

  static String get viewTabs => _viewTabs;

  static String get viewCategoryMeals => _viewCategoryMeals;

  static String get viewMealsDetails => _viewMealsDetails;

  static String get viewFilters => _viewFilters;
}
