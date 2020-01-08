import 'package:flutter/material.dart';
import 'package:meal_4/entity/meal.dart';
import 'package:meal_4/widget/widget_meal.dart';

class ListMeals extends StatefulWidget {
  final List<Meal> _mealsByCategoryId;

  ListMeals(this._mealsByCategoryId);

  @override
  _ListMealsState createState() => _ListMealsState();
}

class _ListMealsState extends State<ListMeals> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._mealsByCategoryId.length,
      itemBuilder: (ctx, index) {
        return WidgetMeal(
          id: widget._mealsByCategoryId[index].id,
          title: widget._mealsByCategoryId[index].title,
          imageUrl: widget._mealsByCategoryId[index].imageUrl,
          duration: widget._mealsByCategoryId[index].duration,
          complex: widget._mealsByCategoryId[index].complexity,
          afford: widget._mealsByCategoryId[index].affordability,
        );
      },
    );
  }
}
