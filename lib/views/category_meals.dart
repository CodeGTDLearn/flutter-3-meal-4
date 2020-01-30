import 'package:flutter/material.dart';
import 'package:meal_4/data/mealsFiltered.dart';

import '../entity/meal.dart';
import '../widget/list_meals.dart';

class ViewCategoryMeals extends StatefulWidget {
  final List<Meal> _displayedMeals = dbFilterMeals;
//  final List<Meal> _displayedMeals;
//
//  ViewCategoryMeals(this._displayedMeals);

  @override
  _ViewCategoryMealsState createState() => _ViewCategoryMealsState();
}

class _ViewCategoryMealsState extends State<ViewCategoryMeals> {
  var _showDisplayedMealsOnce = false;
  List<Meal> _mealsByCategoryId;
  String _categoryTitle;

  @override
  void didChangeDependencies() {
    if (!_showDisplayedMealsOnce) {
      final _routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final _categoryId = _routesArgs['id'];
      _categoryTitle = _routesArgs['title'];
      _mealsByCategoryId = widget._displayedMeals.where((meal) {
        return meal.categories.contains(_categoryId);
      }).toList();
      _showDisplayedMealsOnce = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_categoryTitle)),
      body: ListMeals(_mealsByCategoryId),
    );
  }
}
