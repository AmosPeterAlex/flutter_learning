import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SearchTextFilter(),
  ));
}

class SearchTextFilter extends StatefulWidget {
  const SearchTextFilter({super.key});

  @override
  State<SearchTextFilter> createState() => _SearchTextFilterState();
}

class _SearchTextFilterState extends State<SearchTextFilter> {
  List<String> allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grapes',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
    'Plum',
    'Raspberry',
    'Strawberry',
  ];

  String searchText = '';
  String searchResult = '';

  void filterItems(String query) {
    setState(() {
      searchText = query;
      searchResult =
          ''; // Reset the search result when typing in the search field
    });
  }

  void setSearchResult(String result) {
    setState(() {
      searchResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = allItems
        .where((item) => item.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search and Set Text Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                filterItems(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Enter a fruit name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredItems[index]),
                    onTap: () {
                      setSearchResult(filteredItems[index]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result: $searchResult',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
