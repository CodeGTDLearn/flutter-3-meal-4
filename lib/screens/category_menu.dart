import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_4/config/specs.dart';
import 'package:meal_4/config/titles_icons.dart';
import 'package:meal_4/data/categories.dart';
import 'package:meal_4/widget/card_category.dart';

class ScreenCategoryMenu extends StatelessWidget {
  static Map<String, Object> titles = TitlesAndIcons().tabs;


  @override
  Widget build(BuildContext context) {
    Specs _dim = Specs(context);
    return GridView(
        padding: EdgeInsets.all(_dim.width(7)),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: _dim.width(50),
            childAspectRatio: 1.5,
            mainAxisSpacing: _dim.width(5),
            crossAxisSpacing: _dim.width(5)),
        children: DB_CATEGORIES
            .map((category) => CardCategory(
                  category.id,
                  category.title,
                  category.color,
                ))
            .toList());
  }
}
