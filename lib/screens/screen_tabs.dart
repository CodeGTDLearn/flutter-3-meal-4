import 'package:flutter/material.dart';
import 'package:meal_4/config/titles_icons.dart';

import '../config/tabs.dart';
import '../entity/meal.dart';


class ScreenTabs extends StatefulWidget {
  List<Meal> _favoriteMeals;

  ScreenTabs(this._favoriteMeals);

  @override
  _ScreenTabsState createState() => _ScreenTabsState();
}

class _ScreenTabsState extends State<ScreenTabs> {
  static Map<String, Object> titlesAndIcons = TitlesAndIcons().tabMenus;
  List<Map<String, Object>> _tabPages;
  int _selectedTabByIndex = 0;

  @override
  void initState() {
    _tabPages = TabPages(widget._favoriteMeals).getTabPages;
    super.initState();
  }

  void _selectTab(int newIndexTab) {
    setState(() {
      this._selectedTabByIndex = newIndexTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tabPages[_selectedTabByIndex]['titlePage'])),
      drawer: null,
      body: _tabPages[_selectedTabByIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedTabByIndex,
        selectedFontSize: 20,
        items: [
          BottomNavigationBarItem(
              title: Text(titlesAndIcons['categoryTitle']),
              icon: Icon(titlesAndIcons['categoryIcon']),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              title: Text(titlesAndIcons['favoriteTitle']),
              icon: Icon(titlesAndIcons['categoryIcon']),
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
