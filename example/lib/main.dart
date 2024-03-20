import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Reactive Variables Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a reactive variable with an initial value of 0
  final Rv<int> count = Rv(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive Variables counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Obs(
              rvList: [count],
              builder: (context) {
                return Text(
                  '${count.value}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            count.observer((context, value) => Text(
                  '$value',
                  style: const TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => count.value++, // Increment the count
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
