import 'package:advanced_flutter/state%20management/provider%20example/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const CounterProviderExample(),
    ),
  ));
}

class CounterProviderExample extends StatelessWidget {
  const CounterProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    var counterController = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text('Counter Value : ${counterController.counterValue.value}'),
            ElevatedButton(
                onPressed: () {
                  counterController.incrementCount();
                },
                child: const Text('Increment Value')),
            ElevatedButton(
                onPressed: () {
                  counterController.decrementCount();
                },
                child: const Text('Decrement Value'))
          ],
        ),
      ),
    );
  }
}
