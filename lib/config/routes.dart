import 'package:flutter/material.dart';

import '../utils/parseYaml.dart';
import '../views/category_meals.dart';
import '../views/filters.dart';
import '../views/meals_details.dart';
import '../views/tabs.dart';

class Routes {
  static ParseYaml _py;
  static final String _viewTabs = _py.get("tabs");
  static final String _viewCategoryMeals = _py.get("categoryMeals");
  static final String _viewMealsDetails = _py.get("mealsDetails");
  static final String _viewFilters = _py.get("filters");

  Routes() {
    _py = ParseYaml('./assets/cfg/config.yaml');
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
