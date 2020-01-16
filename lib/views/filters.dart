import 'package:flutter/material.dart';
import 'package:meal_4/widget/drawer.dart';

class ViewFilters extends StatefulWidget {
  ViewFilters();

  @override
  _ViewFiltersState createState() => _ViewFiltersState();
}

class _ViewFiltersState extends State<ViewFilters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TESTE')),
      drawer: Drawwer(),
      body: Container(
        child: Text('filterView'),
      ),
    );
  }
}
