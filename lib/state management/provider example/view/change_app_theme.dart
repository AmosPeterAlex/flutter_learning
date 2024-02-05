import 'package:advanced_flutter/state%20management/provider%20example/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyAppOne()));
}

class MyAppOne extends StatelessWidget {
  const MyAppOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).isDarkTheme
          ? ThemeData.dark()
          : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const AppThemeChangeExample(),
    );
  }
}

class AppThemeChangeExample extends StatelessWidget {
  const AppThemeChangeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).switchTheme();
            },
            child: const Text('Switch Theme')),
      ),
    );
  }
}
