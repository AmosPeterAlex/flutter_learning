import 'package:flutter/material.dart';

class StatefulDataPassing extends StatefulWidget {
  final String name;
  final String? place;

  StatefulDataPassing({super.key, required this.name, this.place});

  @override
  State<StatefulDataPassing> createState() => _StatefulDataPassingState();
}

class _StatefulDataPassingState extends State<StatefulDataPassing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi ${widget.name}'),//widget is a property, stateful aya ile veru. endu type data's um receive cheyam
      ),
    );
  }
}
