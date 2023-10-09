part of '../variable.dart';

extension OnRvIterable<T> on Rv<Iterable<T>> {
  T operator [](int index) {
    return value.elementAt(index);
  }

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;

  int get length => value.length;

  T get first => value.first;
  T get last => value.last;

  T? get firstOrNull => isNotEmpty ? value.first : null;

  T? get lastOrNull => isNotEmpty ? value.last : null;

  Iterable<T> where(bool Function(T) function) => value.where(function);
  T firstWhere(bool Function(T) function) => value.firstWhere(function);
  T lastWhere(bool Function(T) function) => value.lastWhere(function);

  List<T> toList() => value.toList();
}
