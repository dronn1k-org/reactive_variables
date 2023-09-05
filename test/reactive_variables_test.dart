import 'package:flutter_test/flutter_test.dart';

import 'package:reactive_variables/reactive_variables.dart';

void main() {
  test('adds one to input values', () {
    final Rv<int?> temp = Rv(0);
    temp();
    expect(temp.value, 0);
    temp(1);
    expect(temp.value, 1);
  });

  test('silent method', () async {
    var isListenersNotified = false;
    final Rv<int?> temp = Rv(null)
      ..listen((value) {
        isListenersNotified = true;
      });
    expect(temp(), null);
    await Future.delayed(const Duration(milliseconds: 500));
    expect(isListenersNotified, false);
    isListenersNotified = false;

    temp(1);
    expect(temp(), 1);
    await Future.delayed(const Duration(milliseconds: 500));
    expect(isListenersNotified, true);
    isListenersNotified = false;

    temp.silent(0);
    expect(temp(), 0);
    await Future.delayed(const Duration(milliseconds: 500));
    expect(isListenersNotified, false);
  });
}
