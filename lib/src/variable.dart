import 'dart:async';

import 'package:flutter/foundation.dart';

part 'extension/on_rv_iterable.dart';
part 'extension/on_rv_list.dart';
part 'extension/on_rv_map.dart';
part 'extension/on_rv_set.dart';
part 'extension/rv_string_ext.dart';

abstract class RvInterface extends ChangeNotifier implements ValueListenable {}

class Rv<T> extends RvInterface {
  T _value;

  /// Getter for the reactive variable's value.
  @override
  T get value => _value;

  /// Setter for the reactive variable's value.
  /// Notifies listeners if the value changes.
  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    refresh();
  }

  final StreamController<T> _valueStreamCtrl = StreamController.broadcast();

  /// Constructor to initialize the reactive variable with an initial value.
  Rv(this._value);

  /// Triggers a change in the reactive variable's value and notifies listeners.
  void trigger(T v) {
    _value = v;
    refresh();
  }

  /// Refreshes the variable and notifies listeners of changes.
  void refresh() {
    if (_valueStreamCtrl.hasListener) {
      _valueStreamCtrl.add(value);
    }
    if (hasListeners) {
      notifyListeners();
    }
  }

  /// Listen to changes in the reactive variable's value.
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

  /// Function to get or set the value of the reactive variable.
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

  /// Update the value without triggering any listeners.
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
