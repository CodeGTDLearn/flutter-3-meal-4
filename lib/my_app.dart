import 'package:flutter/material.dart';

import './data/db_filters.dart';
import './data/db_meals.dart';

import './entity/meal.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _myAppFilters = DB_FILTERS;
  List<Meal> _displayedMeals = DB_MEALS;
  List<Meal> _favoriteMeals = [];

  void _myAppUpdateFilter(Map<String, bool> _updatedFiltes) {
    setState(() {
      this._myAppFilters = _updatedFiltes;
      this._displayedMeals = DB_MEALS.where((meal) {
        if (this._myAppFilters['isGlutenFree'] && !meal.isGlutenFree)
          return false;
        if (this._myAppFilters['isLactoseFree'] && !meal.isLactoseFree)
          return false;
        if (this._myAppFilters['isVegan'] && !meal.isVegan) return false;
        if (this._myAppFilters['isVegetarian'] && !meal.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final mealIndexInFavoriteMeals =
        this._favoriteMeals.lastIndexWhere((meal) => meal.id == mealId);

    if (mealIndexInFavoriteMeals >= 0) {
      this._favoriteMeals.removeAt(mealIndexInFavoriteMeals);
    } else if (mealIndexInFavoriteMeals == -1) {
      this._favoriteMeals.add(DB_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('teste1'),),
        body: Center(child: Text('teste1')),
      ),
    );
//    return MaterialApp(
//      title: 'Meals 3',
//      debugShowCheckedModeBanner: false,
//      theme: null,
//      initialRoute: null,
//      onGenerateRoute: null,
//      routes: null,
//    );
  }
}
