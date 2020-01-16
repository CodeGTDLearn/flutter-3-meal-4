import 'package:flutter/material.dart';
import 'package:meal_4/widget/drawer.dart';

import '../config/specs.dart';
import '../config/tabs.dart';
import '../config/titles_icons.dart';

class ViewTabs extends StatefulWidget {
  @override
  _ViewTabsState createState() => _ViewTabsState();
}

class _ViewTabsState extends State<ViewTabs> {
  final Map<String, Object> titlesIcons = TitlesAndIcons().tabs;
  List<Map<String, Object>> _tabPages;
  int _tabIndex = 0;

  @override
  void initState() {
    _tabPages = TabPages().getTabPages;
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
      appBar: AppBar(
          title: Text(_tabPages[_tabIndex]['title'],
              style: TextStyle(fontSize: dim.height(4.5)))),

      drawer: Drawwer(),

      //direciona para page, conforme o _tabIndex
      body: _tabPages[_tabIndex]['page'],

      //BottonNavigatorTab
      bottomNavigationBar: BottomNavigationBar(
        //configs
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _tabIndex,
        selectedFontSize: dim.height(3),
        unselectedFontSize: dim.height(2.5),

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
