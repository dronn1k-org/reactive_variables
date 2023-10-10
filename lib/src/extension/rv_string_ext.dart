part of '../variable.dart';

extension RvStringExt on Rv<String> {
  /// Same as [String] `length`
  int get length => value.length;

  /// Same as [String] `runes`
  Runes get runes => value.runes;

  /// Same as [String] `isEmpty`
  bool get isEmpty => value.isEmpty;

  /// Same as [String] `isNotEmpty`
  bool get isNotEmpty => value.isNotEmpty;

  /// Same as [String] `codeUnits`
  List<int> get codeUnits => value.codeUnits;

  String operator [](int index) => value[index];

  /// Same as [String] `replaceAll`
  String replaceAll(Pattern from, String replace) =>
      value.replaceAll(from, replace);

  /// Same as [String] `replaceAllMapped`
  String replaceAllMapped(Pattern from, String Function(Match) replace) =>
      value.replaceAllMapped(from, replace);

  /// Same as [String] `replaceFirst`
  String replaceFirst(Pattern from, String to, [int startIndex = 0]) =>
      value.replaceFirst(from, to, startIndex);

  /// Same as [String] `replaceFirstMapped`
  String replaceFirstMapped(Pattern from, String Function(Match) replace,
          [int startIndex = 0]) =>
      value.replaceFirstMapped(from, replace, startIndex);

  /// Same as [String] `replaceRange`
  String replaceRange(int startIndex, int? endIndex, String replacement) =>
      value.replaceRange(startIndex, endIndex, replacement);

  /// Same as [String] `substring`
  String substring(int start, [int? end]) => value.substring(start, end);

  /// Same as [String] `toLowerCase`
  String toLowerCase() => value.toLowerCase();

  /// Same as [String] `toUpperCase`
  String toUpperCase() => value.toUpperCase();

  /// Same as [String] `contains`
  bool contains(Pattern other, [int startIndex = 0]) =>
      value.contains(other, startIndex);

  /// Same as [String] `compareTo`
  int compareTo(String other) => value.compareTo(other);

  /// Same as [String] `startsWith`
  bool startsWith(String other) => value.startsWith(other);

  /// Same as [String] `endsWith`
  bool endsWith(String other) => value.endsWith(other);

  /// Same as [String] `trim`
  String trim() => value.trim();

  /// Same as [String] `trimLeft`
  String trimLeft() => value.trimLeft();

  /// Same as [String] `trimRight`
  String trimRight() => value.trimRight();

  /// Same as [String] `indexOf`
  int indexOf(Pattern pattern, [int start = 0]) =>
      value.indexOf(pattern, start);

  /// Same as [String] `lastIndexOf`
  int lastIndexOf(Pattern pattern, [int? start]) =>
      value.lastIndexOf(pattern, start);

  /// Same as [String] `split`
  List<String> split(Pattern pattern) => value.split(pattern);

  /// Same as [String] `splitMapJoin`
  String splitMapJoin(
    Pattern pattern, {
    String Function(Match m)? onMatch,
    String Function(String n)? onNonMatch,
  }) =>
      value.splitMapJoin(pattern, onMatch: onMatch, onNonMatch: onNonMatch);

  /// Same as [String] `allMatches`
  Iterable<Match> allMatches(String string, [int start = 0]) =>
      value.allMatches(string, start);

  /// Same as [String] `matchAsPrefix`
  Match? matchAsPrefix(String string, [int start = 0]) =>
      value.matchAsPrefix(string, start);

  /// Same as [String] `codeUnitAt`
  int codeUnitAt(int index) => value.codeUnitAt(index);

  /// Same as [String] `padLeft`
  String padLeft(int width, [String padding = ' ']) =>
      value.padLeft(width, padding);

  /// Same as [String] `padRight`
  String padRight(int width, [String padding = ' ']) =>
      value.padRight(width, padding);
}
