import 'package:flutter/material.dart';
import 'package:meal_4/config/specs.dart';
import 'package:meal_4/config/titles_icons.dart';

import '../config/tabs.dart';
import '../entity/meal.dart';

class ScreenTabs extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  ScreenTabs(this._favoriteMeals);

  @override
  _ScreenTabsState createState() => _ScreenTabsState();
}

class _ScreenTabsState extends State<ScreenTabs> {
  final Map<String, Object> titlesIcons = TitlesAndIcons().tabs;
  List<Map<String, Object>> _tabPages;
  int _tabIndex = 0;

  @override
  void initState() {
    _tabPages = TabPages(widget._favoriteMeals).getTabPages;
    super.initState();
  }

  void _selectTab(int newIndexTab) {
    setState(() {
      this._tabIndex = newIndexTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Specs dim = Specs(context);
    return Scaffold(
      appBar: AppBar(title: Text(_tabPages[_tabIndex]['title'])),
      drawer: null,
      body: _tabPages[_tabIndex]['page'],

      //BottonNavigatorTab
      bottomNavigationBar: BottomNavigationBar(
        //configs
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _tabIndex,
        selectedFontSize: dim.height(3),

        //detecta os 2 Tab Items, e alterna entre eles, automatic
        onTap: _selectTab,

        //barItems
        items: [
          BottomNavigationBarItem(
              title: Text(titlesIcons['categoryTitle']),
              icon: Icon(titlesIcons['categoryIcon']),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              title: Text(titlesIcons['favoriteTitle']),
              icon: Icon(titlesIcons['categoryIcon']),
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
