import 'package:flutter/material.dart';

import '../config/specs.dart';
import '../config/titles_icons.dart';
import '../data/favoriteMeals.dart';
import '../data/meals.dart';
import '../entity/meal.dart';

class MealsDetails extends StatefulWidget {
  @override
  _MealsDetailsState createState() => _MealsDetailsState();
}

class _MealsDetailsState extends State<MealsDetails> {
  List<Meal> _favoriteMeals = DB_FAV_MEALS;
  Specs _dim;

  @override
  Widget build(BuildContext context) {
    _dim = Specs(context);
    final _routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final _mealId = _routesArgs['id'];
    final _selectedMeal = DB_MEALS.firstWhere((meal) => meal.id == _mealId);
    var _titlesIcons = TitlesAndIcons().mealDetails;
    return Scaffold(
      appBar: AppBar(title: Text(_selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    width: _dim.width(100),
                    height: _dim.height(50),
                    child: Image.network(_selectedMeal.imageUrl,
                        fit: BoxFit.cover)),
                Positioned(
                  bottom: _dim.height(2),
                  right: _dim.width(3),
                  child: FloatingActionButton(
                    child: Icon(isMealFavorite(_mealId)
                        ? _titlesIcons['favorite']
                        : _titlesIcons['unFavorite']),
                    onPressed: () => toggleFavorite(_mealId),
                  ),
                )
              ],
            ),
            _title(_dim.width(8), _titlesIcons['ingredientsTitle']),
            _box(ListView.builder(
                itemCount: _selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: _dim.width(2),
                            horizontal: _dim.height(2)),
                        child: Text(_selectedMeal.ingredients[index])),
                  );
                })),
            _title(_dim.width(8), _titlesIcons['stepsTitle']),
            _box(ListView.builder(
              itemCount: _selectedMeal.steps.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      title: Text(
                        _selectedMeal.steps[index],
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Divider(thickness: 3)
                  ],
                );
              },
            )),
          ],
        ),
      ),
    );
  }

  Container _title(double sizeText, String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(_dim.width(1.5)),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: sizeText, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container _box(Widget child) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 7.5,
                  offset: Offset(0.0, 0.0))
            ],
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_dim.radius(3))),
        margin: EdgeInsets.symmetric(horizontal: _dim.width(10)),
        padding: EdgeInsets.all(_dim.radius(3)),
        height: _dim.height(40),
        width: _dim.width(100),
        child: child);
  }

  bool isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  void toggleFavorite(String mealId) {
    final mealIndexInFavoriteMeals =
        this._favoriteMeals.lastIndexWhere((meal) => meal.id == mealId);

    if (mealIndexInFavoriteMeals >= 0) {
      setState(() {
        this._favoriteMeals.removeAt(mealIndexInFavoriteMeals);
      });
    } else if (mealIndexInFavoriteMeals == -1) {
      setState(() {
        this
            ._favoriteMeals
            .add(DB_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
}
