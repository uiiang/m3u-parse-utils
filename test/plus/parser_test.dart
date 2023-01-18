import 'dart:math';

import 'package:m3u/m3u.dart';
import 'package:test/test.dart';

import '../utils/file_loader.dart';

void main() {
  test('M3U_Plus single line - parsing all attribues', () async {
    final playlist =
        await parseFile(await FileUtils.loadFile(fileName: 'plus/single_line'));
    final testSubject = playlist[0];

    expect(testSubject.attributes['tvg-id'], 'identifier');
    expect(testSubject.attributes['tvg-name'], 'a random name');
    expect(testSubject.attributes['tvg-logo'],
        'https://cdn.instructables.com/FGO/LD7W/HF23T3BP/FGOLD7WHF23T3BP.LARGE.jpg');
    expect(testSubject.attributes['group-title'], 'The Only one');
    expect(testSubject.title, 'A TV channel');
    expect(testSubject.link, 'https://vimeo.com/63031638');
    expect(testSubject.duration, -1);
  });

  test('M3U_Plus multi line file', () async {
    final playlist =
        await parseFile(await FileUtils.loadFile(fileName: 'plus/multi_line'));

    playlist.forEach((element) {
      print('link ${element.title}');
      expect(element.link.startsWith('https://'), true);
    });
    expect(playlist.length, 6);
  });
}
