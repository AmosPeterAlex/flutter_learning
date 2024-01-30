import 'dart:math';

import 'package:flutter/material.dart';

class OrientationEX extends StatelessWidget {
  var orientation;

  // const Orientation({super.key});

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation'),
      ),
      body: orientation == Orientation.portrait ? ListScreen() : GridScreen(),
    );
  }
}

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid"),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(
            20,
            (index) => Container(
                  decoration: BoxDecoration(
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                  height: 200,
                  child: Center(
                    child: Text('Grid$index'),
                  ),
                )),
      ),
    );
  }
}

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrientationEX(),
  ));
}//11.45 draktheme example
