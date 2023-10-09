part of '../variable.dart';

extension OnRvList<T> on Rv<List<T>> {
  T operator [](int index) {
    return value[index];
  }

  void operator []=(int index, T value) {
    this.value[index] = value;
    refresh();
  }

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;

  int get length => value.length;

  T get first => value.first;
  T get last => value.last;

  T? get firstOrNull => isNotEmpty ? value.first : null;

  T? get lastOrNull => isNotEmpty ? value.last : null;

  void add(T value) {
    this.value.add(value);
    refresh();
  }

  void addAll(Iterable<T> value) {
    this.value.addAll(value);
    refresh();
  }

  bool remove(Object? value) {
    final removeResult = this.value.remove(value);
    if (removeResult) {
      refresh();
    }
    return removeResult;
  }

  T removeAt(int index) {
    final removedValue = value.removeAt(index);
    refresh();
    return removedValue;
  }

  void removeWhere(bool Function(T) where) {
    value.removeWhere(where);
    refresh();
  }

  void clear() {
    value.clear();
    refresh();
  }

  Iterable<R> map<R>(R Function(T e) map) => value.map(map);

  Iterable<T> where(bool Function(T) function) => value.where(function);
  T firstWhere(bool Function(T) function) => value.firstWhere(function);
  T lastWhere(bool Function(T) function) => value.lastWhere(function);
}
