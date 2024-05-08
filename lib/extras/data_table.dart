import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSearchBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Self Study'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: _searchClicked, icon: const Icon(Icons.search))
          ],
        ),
        body: Column(
          children: [
            _isSearchBarVisible ? const SearchBar() : const SizedBox(),
            Expanded(
              child: Center(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Age')),
                    DataColumn(label: Text('City')),
                  ],
                  rows: const [
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
          ],
        ),
      ),
    );
  }

  void _searchClicked() {
    setState(() {
      _isSearchBarVisible = !_isSearchBarVisible;
    });
  }
}
