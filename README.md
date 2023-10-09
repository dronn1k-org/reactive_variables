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
  reactive_variables: ^0.1.0
```

## 💡 How to use:

#### 1. Create a reactive variable
```dart
final Rv<int> count = Rv(0);
```
or
```dart
final count = 0.rv;
```

#### 2. Listen to changes
```dart
count.listen((value) {
  print("Count changed: $value");
});
```

#### 3. Update the value
```dart
count.trigger(5);
```

#### 4. Auto-refreshing UI
```dart
Obs(
  rvList: [count],
  builder: (context) => Text("Current count: ${count.value}"),
);
```

#### Using with getters and setters
```dart
final Rv<int> rvCount = Rv(0);

int get count => rvCount.value;
set count(int v) => rvCount.trigger(v);
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
