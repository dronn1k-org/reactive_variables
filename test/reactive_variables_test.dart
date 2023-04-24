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
}
