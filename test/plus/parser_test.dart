import 'package:m3u/m3u.dart';
import 'package:test/test.dart';

import '../utils/file_loader.dart';

void main() {
  test('M3U_Plus single line - parsing all attribues', () async {
    final entryWarp = await parseWrapFile(
        await FileUtils.loadFile(fileName: 'plus/single_line'));
    final testSubject = entryWarp.entryList[0];

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
    final entryWarp = await parseWrapFile(
        await FileUtils.loadFile(fileName: 'plus/multi_line'));

    entryWarp.entryList.forEach((element) {
      print('link ${element.link}');
      expect(element.link.startsWith('http'), true);
    });
    expect(entryWarp.entryList.length, 40);
  });
}
