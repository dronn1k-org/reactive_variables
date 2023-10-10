part of '../variable.dart';

/// Extension to provide additional methods for `Rv<Iterable<T>>`.
extension RvIterableExt<T> on Rv<Iterable<T>> {
  /// Gets the element at the specified [index] in the iterable.
  T operator [](int index) {
    return value.elementAt(index);
  }

  /// Returns `true` if the iterable has no elements.
  bool get isEmpty => value.isEmpty;

  /// Returns `true` if the iterable has one or more elements.
  bool get isNotEmpty => value.isNotEmpty;

  /// Returns the number of elements in the iterable.
  int get length => value.length;

  /// Returns the first element in the iterable.
  T get first => value.first;

  /// Returns the last element in the iterable.
  T get last => value.last;

  /// Returns the first element in the iterable, or `null` if the iterable is empty.
  T? get firstOrNull => isNotEmpty ? value.first : null;

  /// Returns the last element in the iterable, or `null` if the iterable is empty.
  T? get lastOrNull => isNotEmpty ? value.last : null;

  /// Returns a new lazy [Iterable] with all elements that satisfy the predicate [function].
  Iterable<T> where(bool Function(T) function) => value.where(function);

  /// Returns the first element that satisfies the given predicate [function].
  T firstWhere(bool Function(T) function) => value.firstWhere(function);

  /// Returns the last element that satisfies the given predicate [function].
  T lastWhere(bool Function(T) function) => value.lastWhere(function);

  /// Returns a new list containing all elements of the iterable.
  List<T> toList() => value.toList();
}
