import 'package:yaml/yaml.dart';
import 'dart:ui';

class ParseYaml {
  Map _fileParsed;
  final String _pathYamlFile = './assets/cfg/teste.json';
  var _output;
  static ParseYaml _instance;

  ParseYaml._singletonConstructor() {
    loadConfigFile();
  }

  factory ParseYaml() {
    _instance ??= ParseYaml._singletonConstructor();
    return _instance;
  }

  loadConfigFile() async {
//    String data = await rootBundle.loadString(_pathYamlFile);

//    File data = File(this._pathYamlFile);
//    if (data != null) {
////      this._fileParsed = loadYaml(data.readAsStringSync());
//      this._fileParsed = loadYaml(data);
//    } else {
//      print('File not found.');
//    }
  }

  String get(var key) {
    this._output = null;
    _fileParsed.forEach((k, v) {
      if (key == k) this._output = v;
    });
    return this._output.toString();
  }
}

void main() {
  ParseYaml p = ParseYaml();
  print(p.get('tabs'));
}
