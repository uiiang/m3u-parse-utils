import 'generic_entry.dart';

class M3uGenericEntryWarp {
  M3uGenericEntryWarp({required this.headerEntry, required this.entryList});

  M3uGenericEntry headerEntry;
  List<M3uGenericEntry> entryList;

  @override
  String toString() => entryList
      .map((e) =>
          'Title: ${e.title} Link:${e.link} hasAttributes:${e.attributes.isNotEmpty}')
      .join('\n');
}
