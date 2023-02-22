import 'dart:async';

import 'package:flutter/foundation.dart';

class Rv<T> extends ChangeNotifier implements ValueListenable {
  T _value;
  @override
  T get value => _value;
  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    if (_valueStreamCtrl.hasListener) {
      _valueStreamCtrl.add(_value);
    }
    if (hasListeners) {
      notifyListeners();
    }
  }

  final StreamController<T> _valueStreamCtrl = StreamController.broadcast();

  Rv(this._value);

  void trigger(T v) {
    _value = v;
    if (_valueStreamCtrl.hasListener) {
      _valueStreamCtrl.add(_value);
    }
    if (hasListeners) {
      notifyListeners();
    }
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
    if (newValue is T) {
      value = newValue;
    }
    return value;
  }
}
