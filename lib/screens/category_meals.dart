import 'package:flutter/material.dart';

import '../entity/meal.dart';
import '../widget/list_meals.dart';

class ScreenCategoryMeals extends StatefulWidget {
  final List<Meal> _displayedMeals;

  ScreenCategoryMeals(this._displayedMeals);

  @override
  _ScreenCategoryMealsState createState() => _ScreenCategoryMealsState();
}

class _ScreenCategoryMealsState extends State<ScreenCategoryMeals> {
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
