import 'dart:convert';
import 'dart:io';

import 'utils/extensions/map.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    throw ArgumentError("Arguments not specified.");
  }

  final json = args.first;
  final key = args.last;

  if (json.isEmpty) {
    throw ArgumentError("Content is empty.");
  }

  if (key.isEmpty) {
    throw ArgumentError("Key to search is empty.");
  }

  final isPath = File(json).existsSync();

  late final Map<String, dynamic> map;

  if (isPath) {
    map = jsonDecode(File(json).readAsStringSync());
  } else {
    map = jsonDecode(json);
  }

  final keyFound = map.whereKey((k) => k == key);

  if (keyFound.isEmpty) {
    print('Key not found');
    return;
  }

  print(keyFound);
}
