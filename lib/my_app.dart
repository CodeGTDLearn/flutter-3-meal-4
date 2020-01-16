import 'package:flutter/material.dart';

import './config/routes.dart';
import './config/themes.dart';
import './data/meals.dart';
import './entity/meal.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//	Map<String, bool> _myAppFilters = FILTERS;
  List<Meal> _displayedMeals = DB_MEALS;

//	void _myAppUpdateFilter(Map<String, bool> _updatedFilters){
//		setState((){
//			this._myAppFilters = _updatedFilters;
//			this._displayedMeals = DB_MEALS.where((meal){
//				if (this._myAppFilters['isGlutenFree'] && !meal.isGlutenFree)
//					return false;
//				if (this._myAppFilters['isLactoseFree'] && !meal.isLactoseFree)
//					return false;
//				if (this._myAppFilters['isVegan'] && !meal.isVegan) return false;
//				if (this._myAppFilters['isVegetarian'] && !meal.isVegetarian)
//					return false;
//				return true;
//			}).toList();
//		});
//	}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals 04',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData,
      initialRoute: Routes.toViewTabs,
      routes: Routes(_displayedMeals).toViews(),
    );
  }
}
//      onGenerateRoute: (settings) {
//        return MaterialPageRoute(
//            builder: (ctx) => ViewCategoryMeals(_displayedMeals));
//      }
//      onUnknownRoute: (settings) {
//        return MaterialPageRoute(builder: (ctx) => ViewTabs());
//      },
