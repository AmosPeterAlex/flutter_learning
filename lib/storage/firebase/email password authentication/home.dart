import 'package:advanced_flutter/storage/firebase/email%20password%20authentication/firebase_functions.dart';
import 'package:advanced_flutter/storage/firebase/email%20password%20authentication/login.dart';
import 'package:flutter/material.dart';

class HomeFirebase extends StatelessWidget {
  const HomeFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  FirebaseHelper().logOut().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginFirebase())));
                },
                child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
