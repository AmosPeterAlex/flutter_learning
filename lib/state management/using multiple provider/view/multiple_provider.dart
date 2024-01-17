import 'package:advanced_flutter/state%20management/using%20multiple%20provider/provider/auth_provider.dart';
import 'package:advanced_flutter/state%20management/using%20multiple%20provider/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<CountProvider>(context, listen: false)
                      .increment();
                },
                child: Text('Increment Counter')),
            SizedBox(
              height: 10,
            ),
            Text(
              'Count value :${Provider.of<CountProvider>(context).count}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Auth Details',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).login
                      ? Provider.of<AuthProvider>(context,listen: false).loggedOut()
                      : Provider.of<AuthProvider>(context,listen: false).loggedIn();
                },
                child: Text('Switch Login')),
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Text(
                    'User is ${authProvider.login ? "Logged In" : "Logged Out"}');
              },
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CountProvider()),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      )
    ], child: MultiProviderExample()),
  ));
}
