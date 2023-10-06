part of '../variable.dart';

extension RvList<T> on Rv<List<T>> {
  T operator [](int index) {
    return value[index];
  }

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;

  int get length => value.length;

  T get first => value.first;
  T get last => value.last;
  T? get firstOrNull {
    try {
      return value.first;
    } catch (e) {
      return null;
    }
  }

  void add(T value) {
    this.value.add(value);
    refresh();
  }

  void addAll(Iterable<T> value) {
    this.value.addAll(value);
    refresh();
  }

  Iterable<T> where(bool Function(T) function) => value.where(function);
  T firstWhere(bool Function(T) function) => value.firstWhere(function);
  T lastWhere(bool Function(T) function) => value.lastWhere(function);
}
