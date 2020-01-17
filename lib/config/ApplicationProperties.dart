import 'dart:io';

import 'package:safe_config/safe_config.dart';

class ApplicationConfiguration extends Configuration {
  ApplicationConfiguration(String YamlConfigFile)
      : super.fromFile(File(YamlConfigFile));

  String tabs;
  String categoryMeals;
  String mealsDetails;
  String filters;
}
