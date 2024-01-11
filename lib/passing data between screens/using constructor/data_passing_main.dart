import 'package:advanced_flutter/passing%20data%20between%20screens/using%20constructor/in%20statefull/data_passing_stateful.dart';
import 'package:advanced_flutter/passing%20data%20between%20screens/using%20constructor/in%20stateless/data_passing_stateless.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DataPassingMain(),
    debugShowCheckedModeBanner: false,
  ));
}

class DataPassingMain extends StatelessWidget {
  DataPassingMain({super.key});

  String name = "Amos Peter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passing Data Between Screens'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StatelessDataPassing(name: name)));
                },
                child: Text('to Stateless')),
            ElevatedButton(onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        StatefulDataPassing(name: name)));}, child: Text('to Stateful'))
          ],
        ),
      ),
    );
  }
}
