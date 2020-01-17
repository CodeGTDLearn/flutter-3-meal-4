import 'package:flutter/material.dart';
import 'package:meal_4/config/specs.dart';
import 'package:meal_4/config/titles_icons.dart';
import 'package:meal_4/data/meals.dart';
import 'package:meal_4/entity/meal.dart';
import 'package:meal_4/widget/drawer.dart';

class ViewFilters extends StatefulWidget {
  final Function _mealsFiltered;
  final Map<String, bool> _myAppFilters;

  ViewFilters(this._mealsFiltered, this._myAppFilters);

  @override
  _ViewFiltersState createState() => _ViewFiltersState();
}

class _ViewFiltersState extends State<ViewFilters> {
  final Map<String, Object> _titles = TitlesAndIcons().filters;
  Map<String, bool> filterMeals;
  bool _isGlutenFree, _isVegetarian, _isVegan, _isLactoseFree;

  @override
  void initState() {
    filterMeals = widget._myAppFilters;
    _isGlutenFree = filterMeals['isGlutenFree'];
    _isLactoseFree = filterMeals['isLactoseFree'];
    _isVegetarian = filterMeals['isVegetarian'];
    _isVegan = filterMeals['isVegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Specs _dim = Specs(context);
    return Scaffold(
      appBar: AppBar(title: Text(_titles['AppbarTitle'])),
      drawer: Drawwer(),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: _dim.height(2)),
          child: Container(
              child: Text(
            _titles['pageTitle'],
            style: TextStyle(fontSize: _dim.height(4)),
            textAlign: TextAlign.center,
          )),
        ),
        Expanded(
          child: ListView(
            children: [
              _switch(_titles['glutTitle'], _titles['glutSubtitle'],
                  this._isGlutenFree, (newValueSwitch) {
                setState(() {
                  this._isGlutenFree = newValueSwitch;
                  _filterActuator();
                });
              }),
              _switch(_titles['lactTitle'], _titles['lactSubtitle'],
                  this._isLactoseFree, (newValueSwitch) {
                setState(() {
                  this._isLactoseFree = newValueSwitch;
                  _filterActuator();
                });
              }),
              _switch(_titles['vegeTitle'], _titles['vegeSubtitle'],
                  this._isVegetarian, (newValueSwitch) {
                setState(() {
                  this._isVegetarian = newValueSwitch;
                  _filterActuator();
                });
              }),
              _switch(_titles['veganTitle'], _titles['veganSubtitle'],
                  this._isVegan, (newValueSwitch) {
                setState(() {
                  this._isVegan = newValueSwitch;
                  _filterActuator();
                });
              })
            ],
          ),
        )
      ]),
    );
  }

  SwitchListTile _switch(
      String title, subtitle, bool currentValueSwitch, Function function) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValueSwitch,
      onChanged: function,
    );
  }

  void _filterActuator() {
    this.filterMeals = {
      'isGlutenFree': _isGlutenFree,
      'isLactoseFree': _isLactoseFree,
      'isVegan': _isVegan,
      'isVegetarian': _isVegetarian
    };

    List<Meal> _mealsAfterFiltering;

    setState(() {
      _mealsAfterFiltering = DB_MEALS.where((meal) {
        if (filterMeals['isGlutenFree'] && !meal.isGlutenFree) return false;
        if (filterMeals['isLactoseFree'] && !meal.isLactoseFree) return false;
        if (filterMeals['isVegan'] && !meal.isVegan) return false;
        if (filterMeals['isVegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });

    this.widget._mealsFiltered(_mealsAfterFiltering, filterMeals);
  }
}
