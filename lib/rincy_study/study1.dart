import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Study1(),
    debugShowCheckedModeBanner: false,
  ));
}

class Study1 extends StatelessWidget {
  // const Study1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,width: 100,
          color: Colors.blue,
          child: Center(
            child: Text('Hi'),
          ),
        ),
      ),
    );
  }
}
