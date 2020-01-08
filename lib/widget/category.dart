import 'package:flutter/material.dart';
import 'package:meal_4/config/routes.dart';

class WidgetCategory extends StatelessWidget {
  final String _id;
  final String _title;
  final Color _color;

  WidgetCategory(this._id, this._title, this._color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          this._title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_color, this._color.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onTap: () => goToScreenCategoryMeals(context),
    );
  }

  void goToScreenCategoryMeals(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.toScreenCategoryMeals,
        arguments: {'id': this._id, 'title': this._title});
  }
}
