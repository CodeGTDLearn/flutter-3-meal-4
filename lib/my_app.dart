import 'package:flutter/material.dart';
import 'package:meal_4/data/filters.dart';

import './config/routes.dart';
import './config/themes.dart';
import './data/meals.dart';
import './entity/meal.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _displayedMeals = DB_MEALS;
  Map<String, bool> _myAppFilters = DB_FILTERS;

  void _mealsFiltered(
      List<Meal> mealsAfterFiltering, Map<String, bool> filtersSelected) {
    this._displayedMeals = mealsAfterFiltering;
    this._myAppFilters = filtersSelected;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals 04',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData,
      initialRoute: Routes.toViewTabs,
      routes: Routes(_displayedMeals, _mealsFiltered, _myAppFilters).toViews(),
    );
  }
}
