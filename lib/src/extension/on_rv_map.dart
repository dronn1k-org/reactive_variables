part of '../variable.dart';

extension OnRvMap<K, V> on Rv<Map<K, V>> {
  V? operator [](K key) {
    return value[key];
  }

  void operator []=(K key, V value) {
    this.value[key] = value;
    refresh();
  }

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;

  int get length => value.length;

  Iterable<K> get keys => value.keys;
  Iterable<V> get values => value.values;

  V? remove(K key) {
    final removedValue = value.remove(key);
    refresh();
    return removedValue;
  }

  void removeWhere(bool Function(K, V) where) {
    value.removeWhere(where);
    refresh();
  }

  void clear() {
    value.clear();
    refresh();
  }

  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K k, V v) converter) =>
      value.map<K2, V2>(converter);
}
