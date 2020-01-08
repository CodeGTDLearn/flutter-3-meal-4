import 'package:flutter/material.dart';
import 'package:meal_4/entity/meal.dart';
import 'package:meal_4/widget/list_meals.dart';

class ScreenCategoryMeals extends StatefulWidget {
  final List<Meal> _displayedMeals;

  ScreenCategoryMeals(this._displayedMeals);

  @override
  _ScreenCategoryMealsState createState() => _ScreenCategoryMealsState();
}

class _ScreenCategoryMealsState extends State<ScreenCategoryMeals> {
  var _initialDisplayedMealsLocker = false;
  List<Meal> _mealListByCategoryId;
  String _categoryTitle;

  @override
  void didChangeDependencies() {
    if (!_initialDisplayedMealsLocker) {
      final _routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final _categoryId = _routesArgs['id'];
      _categoryTitle = _routesArgs['title'];
      _mealListByCategoryId = widget._displayedMeals.where((meal) {
        return meal.categories.contains(_categoryId);
      }).toList();
      _initialDisplayedMealsLocker = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_categoryTitle)),
      body: ListMeals(_mealListByCategoryId),
    );
  }
}
