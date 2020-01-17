import 'package:flutter/material.dart';

import '../config/routes.dart';
import '../utils/specs.dart';

class CardCategory extends StatelessWidget {
  final String _id;
  final String _title;
  final Color _color;

  CardCategory(this._id, this._title, this._color);

  @override
  Widget build(BuildContext context) {
    Specs dim = Specs(context);
    return InkWell(
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(dim.radius(6)),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: dim.height(3.4), vertical: dim.height(4)),
            child: Text(this._title,
                style: TextStyle(
                    fontSize: dim.height(3.4), fontWeight: FontWeight.bold)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [_color, this._color.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(dim.radius(3)),
            )),
        onTap: () => goToScreenCategoryMeals(context));
  }

  void goToScreenCategoryMeals(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.toViewCategoryMeals,
        arguments: {'id': this._id, 'title': this._title});
  }
}
