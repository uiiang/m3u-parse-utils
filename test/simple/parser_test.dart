import 'package:m3u/m3u.dart';
import 'package:test/test.dart';

import '../utils/file_loader.dart';

void main() {
  test('M3U single line - parsing title', () async {
    final entryWarp = await parseWrapFile(
        await FileUtils.loadFile(fileName: 'simple/single_line'));
    final testSubject = entryWarp.entryList[0];
    expect(testSubject.title, 'A TV channel');
    expect(testSubject.link, 'https://vimeo.com/63031638');
    expect(testSubject.duration, -1);
  });

  test('M3U single line - parsing duration', () async {
    final entryWarp = await parseWrapFile(
        await FileUtils.loadFile(fileName: 'simple/single_line_duration'));
    final testSubject = entryWarp.entryList[0];
    expect(testSubject.title, 'A TV channel');
    expect(testSubject.link, 'https://vimeo.com/63031638');
    expect(testSubject.duration, 42);
  });

  test('M3U multi line file', () async {
    final entryWarp = await parseWrapFile(
        await FileUtils.loadFile(fileName: 'simple/multi_line'));

    expect(entryWarp.entryList.length, 5);
  });
}
