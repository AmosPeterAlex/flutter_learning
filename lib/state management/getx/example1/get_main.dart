import 'package:advanced_flutter/state%20management/getx/example1/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(
    home: GetxExample(),
  ));
}

class GetxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CountController controller = Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text("Count is ${controller.count}")),
            ElevatedButton(
                onPressed: () => controller.increment(),
                child: Text('Increment')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => controller.decrement(),
                child: Text('Decrement')),
          ],
        ),
      ),
    );
  }
}
