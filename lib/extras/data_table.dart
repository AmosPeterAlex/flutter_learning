import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DataTable Example'),
        ),
        body: Center(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Age')),
              DataColumn(label: Text('City')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('John')),
                DataCell(Text('30')),
                DataCell(Text('New York')),
              ]),
              DataRow(cells: [
                DataCell(Text('Alice')),
                DataCell(Text('25')),
                DataCell(Text('London')),
              ]),
              DataRow(cells: [
                DataCell(Text('Bob')),
                DataCell(Text('35')),
                DataCell(Text('Paris')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
