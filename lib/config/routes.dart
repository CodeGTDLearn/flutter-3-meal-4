import 'package:flutter/material.dart';
import 'package:meal_4/views/filters.dart';

import '../entity/meal.dart';
import '../views/category_meals.dart';
import '../views/meals_details.dart';
import '../views/tabs.dart';

class Routes {
  //type here your routes
  static final String _tabs = '/';
  static final String _categoryMeals = '/category-meals';
  static final String _mealsDetails = '/meal-details';
  static final String _filters = '/filters';

  final List<Meal> _displayedMeals;
  final Function _mealsFiltered;
  final Map<String, bool> _myAppFilters;

  Routes(this._displayedMeals, this._mealsFiltered, this._myAppFilters);

  Map<String, WidgetBuilder> toViews() {
    return {
      _tabs: (context) => ViewTabs(),
      _categoryMeals: (context) => ViewCategoryMeals(this._displayedMeals),
      _mealsDetails: (context) => ViewMealsDetails(),
      _filters: (context) => ViewFilters(_mealsFiltered, _myAppFilters),
    };
  }

  static String get toViewTabs => _tabs;

  static String get toViewCategoryMeals => _categoryMeals;

  static String get toViewMealsDetails => _mealsDetails;

  static String get toViewFilters => _filters;
}
