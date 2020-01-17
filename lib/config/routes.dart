import 'package:flutter/material.dart';

import './ApplicationProperties.dart';
import '../views/category_meals.dart';
import '../views/filters.dart';
import '../views/meals_details.dart';
import '../views/tabs.dart';

class Routes {
  static var config = ApplicationConfiguration("applicationProperties.yaml");
  static final String _tabs = "${config.tabs}";
  static final String _categoryMeals = "${config.categoryMeals}";
  static final String _mealsDetails = "${config.mealsDetails}";
  static final String _filters = "${config.filters}";

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
