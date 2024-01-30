import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ResponsiveMain(),
  ));
}

class ResponsiveMain extends StatelessWidget {
  // const ResponsiveMain({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Page'),
      ),
      body: width > 600 ? BigScreen() : MobileScreen(),
    );
  }
}

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(color: Colors.pinkAccent),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Text('Video$index'),
                  color: Colors.redAccent,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class BigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BigScreen View'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(color: Colors.yellowAccent),
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Text('Video$index'),
                        color: Colors.purpleAccent,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),  Expanded(child: ListView.builder(itemBuilder: (context, index) {
            Card(
              color: Colors.red,
              child: Text('Video$index'),
            );
          }))
        ],
      ),
    );
  }
}
