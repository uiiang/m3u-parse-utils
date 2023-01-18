import 'dart:io';
import 'package:m3uparse/m3u.dart';

Future<void> main(List<String> arguments) async {
  final fileContent = await File('resources/example.m3u').readAsString();
  final listOfTracks = await parseFile(fileContent);
  print(listOfTracks);

  // Organized categories
  final categories =
      sortedCategories(entries: listOfTracks, attributeName: 'group-title');
  print(categories);
}
