import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_4/config/specs.dart';
import 'package:meal_4/data/favoriteMeals.dart';
import 'package:meal_4/entity/meal.dart';
import 'package:meal_4/widget/list_meals.dart';

class ScreenFavorites extends StatelessWidget {
  final List<Meal> _favoriteMeals = DB_FAV_MEALS;

  @override
  Widget build(BuildContext context) {
    Specs _dim = Specs(context);
    if (this._favoriteMeals.isEmpty) {
      return Container(
          child: Center(
              child: Text('There is no meals as favorites.',
                  style: TextStyle(fontSize: _dim.height(5)),
                  textAlign: TextAlign.center)));
    }
    return ListMeals(_favoriteMeals);
  }
}
