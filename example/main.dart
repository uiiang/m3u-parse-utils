import 'dart:io';
import 'package:m3u/m3u.dart';

Future<void> main(List<String> arguments) async {
  final fileContent = await File('resources/example.m3u').readAsString();
  final entryWarp = await parseWrapFile(fileContent);
  // print(entryWarp);

  // Organized categories
  final categories = sortedCategories(
      entries: entryWarp.entryList, attributeName: 'group-title');
  print(categories);
}
