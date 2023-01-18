library m3u;

import 'package:m3uparse/src/entries/generic_entry.dart';
import 'package:m3uparse/src/m3u_parser.dart';
import 'package:m3uparse/src/playlist_helper.dart';
export 'package:m3uparse/src/exception/invalid_format_exception.dart';

/// Parse a document represented by the [source]
///
/// [source] a string value of the full document.
Future<List<M3uGenericEntry>> parseFile(String source) async =>
    M3uParser.parse(source);

/// From a list of categories return them organized by a property
/// [entries] all the entries from the response
/// [attributeName] name of the attribute to merge for
/// [defaultAttribute] when the attribute is not found category
/// to merge properties.
Map<String, List<M3uGenericEntry>> sortedCategories(
        {required List<M3uGenericEntry> entries,
        required String attributeName,
        String defaultAttribute = 'other'}) =>
    PlaylistHelper.sortedCategories(
        entries: entries,
        attributeName: attributeName,
        defaultAttribute: defaultAttribute);
