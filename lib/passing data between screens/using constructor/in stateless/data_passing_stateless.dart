import 'package:flutter/material.dart';

class StatelessDataPassing extends StatelessWidget {
  final String name;

  StatelessDataPassing({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $name'),
      ),
    );
  }
}
