import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty || args.length < 2) {
    throw ArgumentError("Arguments not specified.");
  }

  if (!File(args.first).existsSync()) {
    throw Exception("File not exists");
  }

  readLines(File(args.first), args.last);
}

readLines(File file, String key) {
  final lines = file.readAsLinesSync();
  for (final line in lines) {
    if (line.contains(key)) {
      final lineNumber = lines.indexWhere((element) => element == line);
      print('$lineNumber - $line');
    }
  }
}
