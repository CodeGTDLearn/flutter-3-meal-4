import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("app_settings");
  runApp(MyApp());
}
