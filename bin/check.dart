import 'dart:convert';
import 'dart:io';
import 'error.dart';
import 'package:path/path.dart' as path;

final alosConfigName = "alos-module.json";
final alosConfigAttr = <String, Type>{
  "startShell": String,
  "name": String,
};

bool checkModule(String targetPath) {
  return checkConfig(targetPath);
}

bool checkConfig(String targetPath) {
  final targetDir = Directory(targetPath);
  if (!targetDir.existsSync()) {
    throw ALOSMPERROR("$targetPath is not exists");
  }

  final alosConfigFile = File(path.absolute(targetPath, alosConfigName));

  if (!alosConfigFile.existsSync()) {
    throw ALOSMPERROR("${alosConfigName} is not find");
  }

  final configData = jsonDecode(utf8.decode(alosConfigFile.readAsBytesSync().toList()));
  for (var checkConfig in alosConfigAttr.entries) {
    final alosConfigValue = configData[checkConfig.key];
    if (alosConfigValue.runtimeType != checkConfig.value) {
      throw ALOSMPERROR("${alosConfigName} ${checkConfig.key} in config of type is ${alosConfigValue.runtimeType} need ${checkConfig.value} ");
    }
  }

  return true;
}
