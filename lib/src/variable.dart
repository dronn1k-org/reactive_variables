import 'dart:async';

import 'package:flutter/foundation.dart';

part 'extension/on_rv_list.dart';
part 'extension/on_rv_iterable.dart';
part 'extension/on_rv_map.dart';
part 'extension/on_rv_set.dart';

abstract class RvInterface extends ChangeNotifier implements ValueListenable {}

class Rv<T> extends RvInterface {
  T _value;
  @override
  T get value => _value;
  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    refresh();
  }

  final StreamController<T> _valueStreamCtrl = StreamController.broadcast();

  Rv(this._value);

  void trigger(T v) {
    _value = v;
    refresh();
  }

  void refresh() {
    if (_valueStreamCtrl.hasListener) {
      _valueStreamCtrl.add(value);
    }
    if (hasListeners) {
      notifyListeners();
    }
  }

  StreamSubscription<T> listen(
    void Function(T value) listener, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      _valueStreamCtrl.stream.listen(
        listener,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError,
      );

  T call([T? newValue]) {
    if (newValue != null) {
      value = newValue;
    }
    return value;
  }

  @override
  void dispose() {
    _valueStreamCtrl.close();
    super.dispose();
  }

  void updateSilently(T newValue) => _value = newValue;

  @override
  bool operator ==(Object? other) {
    if (other is T) return value == other;
    if (other is Rv<T>) return value == other.value;
    return false;
  }

  @override
  int get hashCode =>
      _value.hashCode ^
      _valueStreamCtrl.hashCode ^
      trigger.hashCode ^
      refresh.hashCode ^
      listen.hashCode ^
      call.hashCode ^
      dispose.hashCode ^
      updateSilently.hashCode;
}
