import 'package:flutter/material.dart';

import '../config/tabs.dart';
import '../entity/meal.dart';


class ScreenTabs extends StatefulWidget {
  List<Meal> _favoriteMeals;

  ScreenTabs(this._favoriteMeals);

  @override
  _ScreenTabsState createState() => _ScreenTabsState();
}

class _ScreenTabsState extends State<ScreenTabs> {
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
      appBar: AppBar(title: Text('Tabs to Select')),
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
              icon: Icon(Icons.category),
              title: Text('Category'),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Category'),
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
