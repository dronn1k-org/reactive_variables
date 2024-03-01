# Reactive Variables for Flutter

Make your Flutter app's state management easier with `reactive_variables`. This package offers a simple way to create reactive variables, ensuring your UI always stays in sync.
## 🌟 Features:
- **Simplicity**: Create reactive variables without the fuss.
- **UI Synchronization**: Widgets automatically refresh when your reactive variables change.
- **Flexibility**: Comes with extensions that cater to various data types and collections.

## 🔧 Installation:
Add this to your `pubspec.yaml`:

```yaml
dependencies:
  reactive_variables: ^1.0.0
```

## 💡 How to use:

#### 1. Create a reactive variable

Creating by the constructor of RV:

```dart
final count = Rv(0);
final someString = Rv('');

final stringList = Rv<List<String>>([]);

final Rv<int?> nullableInt = Rv(null);
```
or by the type extensions:
```dart
final count = 0.rv;
final someString = ''.rv;

final stringList = <String>[].rv;
// or
final stringList = ['123'].rv;

// Yes. We have an extension for Null class but we not really sure that it is useful
final nullableInt = null.rv<int>();
// Just try it and give a feedback of using. =)
```

#### 2. Listen to changes
```dart
// You are aible to receive a [StreamSubscription]
final countSubscription = count.listen((value) {
  print("Value has been changed to: $value");
});

// or observe the value via [ChangeNotifier] methods
void countListener() => print("Value has been changed to: ${count.value}");
count.addListener(countListener);
```

#### 3. Update the value

There are 3 ways to put a new value to an RV variable:
```dart
count.value = 5;
```
In this case a new value will be compared to an old one. If they are equal, none of listeners will be notified.

But if we want to notify listeners even when old & new values are equal, we should use the `trigger` method.
```dart
count.trigger(5); 
```

Also we can put a new value by the `call` method:
```dart
count(5);
```
In this case a value changing is working like in the first updating example (if old & new value are same, none listener wil be notified).

#### 4. Auto-refreshing UI
```dart
// Simple widget wrapper (OBS) that will listen for changes of RV that we provide to the Obs instance.
Obs(
  rvList: [count],
  builder: (context) => Text("Current count: ${count.value}"),
);

// or we can use `observer` method from the RV to build an observer widget.
count.observer((context, value) => Text("Current count: ${count.value}"));

// If you have to observe a list of RV with the same observer, you can put them in the list and use the same method.
[count, someRV].observer((context) => Text("Current count: ${count.value}"));
```

## 📦 Extensions:

Easily handle different data types:

```dart
final items = <String>{}.rv;
items.add("apple");
items.remove("apple");
```

## 📜 License:
[MIT](LICENSE)
