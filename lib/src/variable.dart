import 'dart:async';

import 'package:flutter/foundation.dart';

class Rv<T> extends ChangeNotifier implements ValueListenable {
  T _value;
  @override
  T get value => _value;
  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    _valueStreamCtrl.add(_value);
    notifyListeners();
  }

  final StreamController<T> _valueStreamCtrl = StreamController.broadcast();

  Rv(this._value);

  void trigger(T v) {
    _value = v;
    _valueStreamCtrl.add(_value);
    notifyListeners();
  }

  void refresh() {
    _valueStreamCtrl.add(value);
    notifyListeners();
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
}
