part of '../variable.dart';

/// Extension to provide additional methods for `Rv<Map<K, V>>`.
extension OnRvMap<K, V> on Rv<Map<K, V>> {
  /// Retrieves the value associated with the given [key] in the map.
  V? operator [](K key) {
    return value[key];
  }

  /// Associates the given [key] with the given [value] in the map.
  void operator []=(K key, V value) {
    this.value[key] = value;
    refresh();
  }

  /// Returns `true` if the map has no key-value pairs.
  bool get isEmpty => value.isEmpty;

  /// Returns `true` if the map has one or more key-value pairs.
  bool get isNotEmpty => value.isNotEmpty;

  /// Returns the number of key-value pairs in the map.
  int get length => value.length;

  /// Returns an iterable of all keys in the map.
  Iterable<K> get keys => value.keys;

  /// Returns an iterable of all values in the map.
  Iterable<V> get values => value.values;

  /// Removes the key-value pair with the given [key] from the map.
  /// Returns the value associated with the [key], or `null` if the key was not present in the map.
  V? remove(K key) {
    final removedValue = value.remove(key);
    refresh();
    return removedValue;
  }

  /// Removes all key-value pairs from the map that satisfy the given predicate [where].
  void removeWhere(bool Function(K, V) where) {
    value.removeWhere(where);
    refresh();
  }

  /// Removes all key-value pairs from the map.
  void clear() {
    value.clear();
    refresh();
  }

  /// Transforms the map by applying a function to all its key-value pairs.
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K k, V v) converter) =>
      value.map<K2, V2>(converter);
}
