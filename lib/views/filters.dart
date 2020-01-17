import 'package:flutter/material.dart';

import '../config/titles_icons.dart';
import '../data/filters.dart';
import '../utils/filter_utils.dart';
import '../utils/specs.dart';
import '../widget/drawer.dart';

class ViewFilters extends StatefulWidget {
  Map<String, bool> _myAppFilters = DB_FILTERS;

  @override
  _ViewFiltersState createState() => _ViewFiltersState();
}

class _ViewFiltersState extends State<ViewFilters> {
  final Map<String, Object> _titles = TitlesAndIcons().filters;
  bool _noGluten, _isVegetarian, _isVegan, _noLactose;
  Specs _dim;

  @override
  void initState() {
    _noGluten = widget._myAppFilters['isGlutenFree'];
    _noLactose = widget._myAppFilters['isLactoseFree'];
    _isVegetarian = widget._myAppFilters['isVegetarian'];
    _isVegan = widget._myAppFilters['isVegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dim = Specs(context);
    FilterUtils _filter = FilterUtils();
    return Scaffold(
        appBar: AppBar(title: Text(_titles['AppbarTitle'])),
        drawer: Drawwer(),
        body: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: _dim.height(2)),
              child: Container(
                  child: Text(_titles['pageTitle'],
                      style: TextStyle(fontSize: _dim.height(4)),
                      textAlign: TextAlign.center))),
          Expanded(
              child: ListView(children: [
            _switch(
                _titles['glutTitle'], _titles['glutSubtitle'], this._noGluten,
                (newValueSwitch) {
              setState(() {
                this._noGluten = newValueSwitch;
                _filter.updater(_noGluten, _noLactose, _isVegan, _isVegetarian);
              });
            }),
            _switch(
                _titles['lactTitle'], _titles['lactSubtitle'], this._noLactose,
                (newValueSwitch) {
              setState(() {
                this._noLactose = newValueSwitch;
                _filter.updater(_noGluten, _noLactose, _isVegan, _isVegetarian);
              });
            }),
            _switch(_titles['vegeTitle'], _titles['vegeSubtitle'],
                this._isVegetarian, (newValueSwitch) {
              setState(() {
                this._isVegetarian = newValueSwitch;
                _filter.updater(_noGluten, _noLactose, _isVegan, _isVegetarian);
              });
            }),
            _switch(
                _titles['veganTitle'], _titles['veganSubtitle'], this._isVegan,
                (newValueSwitch) {
              setState(() {
                this._isVegan = newValueSwitch;
                _filter.updater(_noGluten, _noLactose, _isVegan, _isVegetarian);
              });
            })
          ]))
        ]));
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
}
