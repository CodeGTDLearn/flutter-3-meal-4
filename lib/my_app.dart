import 'package:flutter/material.dart';

import './config/routes.dart';
import './config/themes.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals 04',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeData,
        initialRoute: Routes.toViewTabs,
        routes: Routes().toViews());
  }
}
