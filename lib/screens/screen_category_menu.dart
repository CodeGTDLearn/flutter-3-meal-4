import 'package:flutter/material.dart';
import 'package:meal_4/config/titles_icons.dart';

class ScreenCategoryMenu extends StatefulWidget {
  @override
  _ScreenCategoryMenuState createState() => _ScreenCategoryMenuState();

  ScreenCategoryMenu();
}

class _ScreenCategoryMenuState extends State<ScreenCategoryMenu> {
  static Map<String, Object> titles = TitlesAndIcons().tabMenus;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('ScreenCategoryMenu')),
    );
  }
}
