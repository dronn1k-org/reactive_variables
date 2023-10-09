import 'package:reactive_variables/reactive_variables.dart';

extension RvOnNull on Null {
  Rv<T?> rv<T>() => Rv<T?>(null);
}

extension RvOnString on String {
  Rv<String> get rv => Rv(this);
}

extension RvOnBool on bool {
  Rv<bool> get rv => Rv(this);
}

extension RvOnInt on int {
  Rv<int> get rv => Rv(this);
}

extension RvOnDouble on double {
  Rv<double> get rv => Rv(this);
}

extension RvOnIterable<T> on Iterable<T> {
  Rv<Iterable<T>> get rv => Rv(this);
}

extension RvOnList<T> on List<T> {
  Rv<List<T>> get rv => Rv(this);
}

extension RvOnSet<T> on Set<T> {
  Rv<Set<T>> get rv => Rv(this);
}

extension RvOnMap<K, V> on Map<K, V> {
  Rv<Map<K, V>> get rv => Rv(this);
}
