import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_variables/reactive_variables.dart';

void main() {
  test('Initial value is set correctly', () {
    final Rv<int?> temp = Rv(50);
    expect(temp.value, 50);
  });

  test('Multiple listeners are notified', () async {
    final Rv<int> temp = Rv(0);
    int listener1Value = 0;
    int listener2Value = 0;

    temp.listen((value) {
      listener1Value = value;
    });

    temp.listen((value) {
      listener2Value = value;
    });

    temp.trigger(5);

    await Future.delayed(Duration.zero);

    expect(listener1Value, 5);
    expect(listener2Value, 5);
  });

  test('Listeners can be removed', () async {
    final Rv<int> temp = Rv(0);
    int listenerValue = 0;

    final subscription = temp.listen((value) {
      listenerValue = value;
    });

    subscription.cancel(); // Remove the listener
    temp.trigger(5);

    expect(listenerValue, 0); // Value should remain unchanged
  });

  test('Basic Rv creation and modification', () {
    final Rv<int?> temp = Rv(0);
    temp();
    expect(temp.value, 0);
    temp(1);
    expect(temp.value, 1);
  });

  test('Silent update without notifying listeners', () async {
    bool isListenersNotified = false;
    final Rv<int?> temp = Rv(null)
      ..listen((value) {
        isListenersNotified = true;
      });
    expect(temp(), null);

    await Future.delayed(Duration.zero);

    expect(isListenersNotified, false);
    isListenersNotified = false;

    temp(1);
    expect(temp(), 1);

    await Future.delayed(Duration.zero);

    expect(isListenersNotified, true);
    isListenersNotified = false;

    temp.updateSilently(0);
    expect(temp(), 0);

    await Future.delayed(Duration.zero);

    expect(isListenersNotified, false);
  });

  group('Extensions', () {
    test('List extension methods', () {
      final Rv<List<int>> tempList = Rv([1, 2, 3]);

      tempList.add(4);
      expect(tempList.value, [1, 2, 3, 4]);

      tempList.remove(1);
      expect(tempList.value, [2, 3, 4]);
    });

    test('RvOnNull creates a reactive variable with null value', () {
      final rvNull = null.rv<String>();
      expect(rvNull.value, null);
    });

    test('RvOnString creates a reactive variable for strings', () {
      final rvString = 'Hello'.rv;
      expect(rvString.value, 'Hello');
    });

    test('RvOnBool creates a reactive variable for booleans', () {
      final rvBool = true.rv;
      expect(rvBool.value, true);
    });

    test('RvOnInt creates a reactive variable for integers', () {
      final rvInt = 50.rv;
      expect(rvInt.value, 50);
    });

    test('RvOnDouble creates a reactive variable for doubles', () {
      final rvDouble = 3.14.rv;
      expect(rvDouble.value, 3.14);
    });

    test('RvOnIterable creates a reactive variable for iterables', () {
      final rvIterable = [1, 2, 3].rv;
      expect(rvIterable.value, [1, 2, 3]);
    });

    test('RvOnList creates a reactive variable for lists', () {
      final rvList = [1, 2, 3].rv;
      expect(rvList.value, [1, 2, 3]);
    });

    test('RvOnSet creates a reactive variable for sets', () {
      final rvSet = {1, 2, 3}.rv;
      expect(rvSet.value, {1, 2, 3});
    });

    test('RvOnMap creates a reactive variable for maps', () {
      final rvMap = {'key': 'value'}.rv;
      expect(rvMap.value, {'key': 'value'});
    });
  });

  group('Equality', () {
    test('Overloaded equality operator', () {
      final firstString = '123'.rv;
      final secondString = '123'.rv;

      expect(firstString == secondString, true);

      firstString('321');

      expect(firstString == secondString, false);
    });

    test('hashCode testing', () {
      final firstString = '123'.rv;
      Rv<String> secondString = firstString;

      expect(firstString.hashCode == secondString.hashCode, true);

      secondString = '123'.rv;

      expect(firstString.hashCode == secondString.hashCode, false);
    });
  });
}
