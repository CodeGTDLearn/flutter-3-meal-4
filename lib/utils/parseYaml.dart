import 'dart:io';

import 'package:yaml/yaml.dart';

class ParseYaml {
  Map _fileParsed;
  final String _pathYamlFile = './assets/cfg/config.yaml';
  var _output;
  static ParseYaml _instance;

  ParseYaml._singletonConstructor() {
    loadConfigFile();
  }

  factory ParseYaml() {
    _instance ??= ParseYaml._singletonConstructor();
    return _instance;
  }

  loadConfigFile() {
    File file = File(this._pathYamlFile);
    if (file.existsSync()) {
      this._fileParsed = loadYaml(file.readAsStringSync());
    } else {
      print('File not found.');
    }
  }

  String get(var key) {
    this._output = null;
    _fileParsed.forEach((k, v) {
      if (key == k) this._output = v;
    });
    return this._output.toString();
  }

  @override
  String toString() {
    return 'ParseYaml{_configFileParsed: $_fileParsed}';
  }
}

void main() {
  ParseYaml p = ParseYaml();
  print(p.toString());
}
