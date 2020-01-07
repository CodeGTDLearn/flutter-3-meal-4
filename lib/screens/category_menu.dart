import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_4/config/titles_icons.dart';
import 'package:meal_4/data/categories.dart';
import 'package:meal_4/widget/category.dart';

class ScreenCategoryMenu extends StatelessWidget {
  static Map<String, Object> titles = TitlesAndIcons().tabMenus;

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: DB_CATEGORIES.map((category) => WidgetCategory(
              category.id,
              category.title,
              category.color,
            )).toList());
  }
}
