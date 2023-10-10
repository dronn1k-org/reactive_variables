import 'package:reactive_variables/reactive_variables.dart';

/// An extension on `Null` to create a reactive variable (`Rv`) of type `T` with a null value.
extension RvOnNull on Null {
  /// Returns a reactive variable (`Rv`) with a null value.
  Rv<T?> rv<T>() => Rv<T?>(null);
}

/// An extension on `String` to create a reactive variable (`Rv<String>`).
extension RvOnString on String {
  /// Returns a reactive variable (`Rv<String>`) initialized with this String value.
  Rv<String> get rv => Rv<String>(this);
}

/// An extension on `bool` to create a reactive variable (`Rv<bool>`).
extension RvOnBool on bool {
  /// Returns a reactive variable (`Rv<bool>`) initialized with this bool value.
  Rv<bool> get rv => Rv<bool>(this);
}

/// An extension on `int` to create a reactive variable (`Rv<int>`).
extension RvOnInt on int {
  /// Returns a reactive variable (`Rv<int>`) initialized with this int value.
  Rv<int> get rv => Rv<int>(this);
}

/// An extension on `double` to create a reactive variable (`Rv<double>`).
extension RvOnDouble on double {
  /// Returns a reactive variable (`Rv<double>`) initialized with this double value.
  Rv<double> get rv => Rv<double>(this);
}

/// An extension on `Iterable<T>` to create a reactive variable (`Rv<Iterable<T>>`).
extension RvOnIterable<T> on Iterable<T> {
  /// Returns a reactive variable (`Rv<Iterable<T>>`) initialized with this Iterable value.
  Rv<Iterable<T>> get rv => Rv<Iterable<T>>(this);
}

/// An extension on `List<T>` to create a reactive variable (`Rv<List<T>>`).
extension RvOnList<T> on List<T> {
  /// Returns a reactive variable (`Rv<List<T>>`) initialized with this List value.
  Rv<List<T>> get rv => Rv<List<T>>(this);
}

/// An extension on `Set<T>` to create a reactive variable (`Rv<Set<T>>`).
extension RvOnSet<T> on Set<T> {
  /// Returns a reactive variable (`Rv<Set<T>>`) initialized with this Set value.
  Rv<Set<T>> get rv => Rv<Set<T>>(this);
}

/// An extension on `Map<K, V>` to create a reactive variable (`Rv<Map<K, V>>`).
extension RvOnMap<K, V> on Map<K, V> {
  /// Returns a reactive variable (`Rv<Map<K, V>>`) initialized with this Map value.
  Rv<Map<K, V>> get rv => Rv<Map<K, V>>(this);
}
