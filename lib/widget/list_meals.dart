import 'package:flutter/material.dart';
import 'package:meal_4/entity/meal.dart';
import 'package:meal_4/widget/card_meal.dart';

class ListMeals extends StatefulWidget {
  final List<Meal> _meals;

  ListMeals(this._meals);

  @override
  _ListMealsState createState() => _ListMealsState();
}

class _ListMealsState extends State<ListMeals> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._meals.length,
      itemBuilder: (ctx, index) {
        return CardMeal(
          id: widget._meals[index].id,
          title: widget._meals[index].title,
          imageUrl: widget._meals[index].imageUrl,
          duration: widget._meals[index].duration,
          complex: widget._meals[index].complexity,
          afford: widget._meals[index].affordability,
        );
      },
    );
  }
}
