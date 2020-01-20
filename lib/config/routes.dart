import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import '../views/category_meals.dart';
import '../views/filters.dart';
import '../views/meals_details.dart';
import '../views/tabs.dart';

class Routes {
  static final String _viewTabs = _cfg.getString("tabs");
  static final String _viewCategoryMeals = _cfg.getString("categoryMeals");
  static final String _viewMealsDetails = _cfg.getString("mealsDetails");
  static final String _viewFilters = _cfg.getString("filters");
  static GlobalConfiguration _cfg;

  Routes() {
    _cfg = new GlobalConfiguration();
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
