import 'package:flutter/material.dart';
import 'package:meal_4/config/routes.dart';
import 'package:meal_4/config/specs.dart';
import 'package:meal_4/config/titles_icons.dart';

class Drawwer extends StatelessWidget {
  final Map<String, Object> _titlesIcons = TitlesAndIcons().drawer;
  Specs _dim;

  @override
  Widget build(BuildContext context) {
    _dim = Specs(context);

    ListTile _listTile(String title, IconData icon, String route) {
      return ListTile(
          leading: Icon(icon, size: _dim.height(5)),
          title: Text(title,
              style: TextStyle(
                  fontSize: _dim.height(5), fontWeight: FontWeight.bold)),
          onTap: () => Navigator.of(context).pushReplacementNamed(route));
    }

    return Drawer(
        elevation: 4,
        child: Column(children: [
          Container(
            child: Text(_titlesIcons['title'],
                style: TextStyle(
                    fontSize: _dim.height(7), fontWeight: FontWeight.bold)),
            height: _dim.height(25),
            padding: EdgeInsets.only(left: _dim.height(3), top: _dim.height(5)),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: _dim.height(3)),
          _listTile(_titlesIcons['mealsTitle'], _titlesIcons['mealsIcon'],
              Routes.toScreenTabs),
          _listTile(_titlesIcons['settingsTitle'], _titlesIcons['settingsIcon'],
              Routes.toScreenFilters)
        ]));
  }
}
