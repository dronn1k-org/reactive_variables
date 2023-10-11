part of '../variable.dart';

/// Extension to provide additional methods for `Rv<Set<T>>`.
extension RvSetExt<T> on Rv<Set<T>> {
  /// Retrieves the element at the specified [index] in the set.
  T operator [](int index) {
    return value.elementAt(index);
  }

  /// Returns `true` if the set has no elements.
  bool get isEmpty => value.isEmpty;

  /// Returns `true` if the set has one or more elements.
  bool get isNotEmpty => value.isNotEmpty;

  /// Returns the number of elements in the set.
  int get length => value.length;

  /// Returns the first element in the set.
  T get first => value.first;

  /// Returns the last element in the set.
  T get last => value.last;

  /// Returns the first element in the set, or `null` if the set is empty.
  T? get firstOrNull => isNotEmpty ? value.first : null;

  /// Returns the last element in the set, or `null` if the set is empty.
  T? get lastOrNull => isNotEmpty ? value.last : null;

  /// Adds the given [value] to the set.
  void add(T value) {
    this.value.add(value);
    refresh();
  }

  /// Appends all elements from the given [value] to the set.
  void addAll(Iterable<T> value) {
    this.value.addAll(value);
    refresh();
  }

  /// Removes the first occurrence of the given [value] from the set.
  /// Returns `true` if the element was removed, `false` otherwise.
  bool remove(Object? value) {
    final removeResult = this.value.remove(value);
    if (removeResult) {
      refresh();
    }
    return removeResult;
  }

  /// Removes all elements from the set that satisfy the given predicate [where].
  void removeWhere(bool Function(T) where) {
    value.removeWhere(where);
    refresh();
  }

  /// Removes all elements from the set.
  void clear() {
    value.clear();
    refresh();
  }

  /// Transforms the set by applying a function to all its elements.
  Iterable<R> map<R>(R Function(T e) map) => value.map(map);

  /// Returns a new lazy [Iterable] with all elements that satisfy the predicate [function].
  Iterable<T> where(bool Function(T) function) => value.where(function);

  /// Returns the first element that satisfies the given predicate [function].
  T firstWhere(bool Function(T) function) => value.firstWhere(function);

  /// Returns the last element that satisfies the given predicate [function].
  T lastWhere(bool Function(T) function) => value.lastWhere(function);
}
