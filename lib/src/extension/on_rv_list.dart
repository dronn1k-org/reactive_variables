part of '../variable.dart';

/// Extension to provide additional methods for `Rv<List<T>>`.
extension OnRvList<T> on Rv<List<T>> {
  /// Gets the element at the specified [index] in the list.
  T operator [](int index) {
    return value[index];
  }

  /// Sets the element at the specified [index] in the list to the given [value].
  void operator []=(int index, T value) {
    this.value[index] = value;
    refresh();
  }

  /// Returns `true` if the list has no elements.
  bool get isEmpty => value.isEmpty;

  /// Returns `true` if the list has one or more elements.
  bool get isNotEmpty => value.isNotEmpty;

  /// Returns the number of elements in the list.
  int get length => value.length;

  /// Returns the first element in the list.
  T get first => value.first;

  /// Returns the last element in the list.
  T get last => value.last;

  /// Returns the first element in the list, or `null` if the list is empty.
  T? get firstOrNull => isNotEmpty ? value.first : null;

  /// Returns the last element in the list, or `null` if the list is empty.
  T? get lastOrNull => isNotEmpty ? value.last : null;

  /// Adds the given [value] to the end of the list.
  void add(T value) {
    this.value.add(value);
    refresh();
  }

  /// Appends all elements from the given [value] to the end of the list.
  void addAll(Iterable<T> value) {
    this.value.addAll(value);
    refresh();
  }

  /// Removes the first occurrence of the given [value] from the list.
  /// Returns `true` if the element was removed, `false` otherwise.
  bool remove(Object? value) {
    final removeResult = this.value.remove(value);
    if (removeResult) {
      refresh();
    }
    return removeResult;
  }

  /// Removes the element at the specified [index] from the list.
  /// Returns the removed element.
  T removeAt(int index) {
    final removedValue = value.removeAt(index);
    refresh();
    return removedValue;
  }

  /// Removes all elements that satisfy the given predicate [where] from the list.
  void removeWhere(bool Function(T) where) {
    value.removeWhere(where);
    refresh();
  }

  /// Removes all elements from the list.
  void clear() {
    value.clear();
    refresh();
  }

  /// Returns a new lazy [Iterable] with elements transformed by the given function [map].
  Iterable<R> map<R>(R Function(T e) map) => value.map(map);

  /// Returns a new lazy [Iterable] with all elements that satisfy the predicate [function].
  Iterable<T> where(bool Function(T) function) => value.where(function);

  /// Returns the first element that satisfies the given predicate [function].
  T firstWhere(bool Function(T) function) => value.firstWhere(function);

  /// Returns the last element that satisfies the given predicate [function].
  T lastWhere(bool Function(T) function) => value.lastWhere(function);
}
