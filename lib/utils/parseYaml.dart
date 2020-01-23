import 'dart:io';

import 'package:yaml/yaml.dart';

class ParseYaml {
  Map _fileParsed;
  String _pathFile;
  var _output;

  static ParseYaml _instance;

  ParseYaml._singletonConstructor(String configPathFile) {
    this._pathFile = configPathFile;
    loadConfigFile();
  }

  factory ParseYaml(String configPathFile) {
    _instance ??= ParseYaml._singletonConstructor(configPathFile);
    return _instance;
  }

  loadConfigFile() {
    File file = File(this._pathFile);
    if (file.existsSync()) {
      //todo nao esta achando o arquivo, ele salta este if!!!why?
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
  ParseYaml p = ParseYaml('./assets/cfg/concfig.yaml');
  print(p.toString());
}
