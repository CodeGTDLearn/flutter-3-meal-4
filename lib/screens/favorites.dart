import 'package:flutter/material.dart';
import 'package:meal_4/config/titles_icons.dart';
import 'package:meal_4/entity/meal.dart';

class ScreenFavorites extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  static Map<String, Object> titles = TitlesAndIcons().tabMenus;

  ScreenFavorites(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('screenfavorites')),
    );
  }
}
