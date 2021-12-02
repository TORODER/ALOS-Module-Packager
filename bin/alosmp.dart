import 'package:archive/archive.dart';
import 'package:args/args.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

import 'check.dart';
import 'error.dart';

/// 模块目录文件夹
class ArgAttr {
  static const dir = "dir";
}

const outFileExt = "amp";
final nowPath = Directory.current.path;

void main(List<String> arguments) {
  final parserArgs = initArg().parse(arguments);
  final targetName = parserArgs[ArgAttr.dir];
  final targetPath = path.absolute(nowPath, targetName);
  if (checkModule(targetPath)) {
    final outPath = zipDir(targetPath, targetName);
    print("Out AMP Success $outPath");
  } else {
    throw ALOSMPERROR("Module Check Error!");
  }
}

String zipDir(String targetDirPath, String outName) {
  final zipFileEncoder = ZipFileEncoder();
  final outFileName = "$outName.$outFileExt";
  zipFileEncoder.create(outFileName);
  zipFileEncoder.addDirectory(Directory(targetDirPath));
  zipFileEncoder.close();
  return zipFileEncoder.zip_path;
}

ArgParser initArg() {
  final argParser = ArgParser();
  argParser.addOption(ArgAttr.dir, mandatory: true);
  return argParser;
}
