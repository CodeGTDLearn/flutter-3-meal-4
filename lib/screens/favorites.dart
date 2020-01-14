import 'package:flutter/material.dart';
import 'package:meal_4/entity/meal.dart';

class ScreenFavorites extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  ScreenFavorites(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (this._favoriteMeals.isNotEmpty) {
      return Container(
        child: Center(child: Text('listanaovazia')),
      );
    } else {
      return Container(
        child: Center(child: Text('listavazia')),
      );

    }
  }
}
