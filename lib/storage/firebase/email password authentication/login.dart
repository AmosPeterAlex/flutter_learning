import 'package:advanced_flutter/storage/firebase/email%20password%20authentication/home.dart';
import 'package:advanced_flutter/storage/firebase/email%20password%20authentication/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_functions.dart';

/*
WidgetsFlutterBinding is a class in the Flutter framework responsible
for initializing and binding the Flutter framework to the platform.
It is part of the widget framework and plays a crucial role in managing
the interaction between the Flutter code and the underlying platform.

ensureInitialized() is a method provided by the WidgetsFlutterBinding class.
It ensures that the Flutter framework is properly initialized and bound to the
platform.This method is often called at the beginning of a Flutter app,
especially if there are operations or plugins that depend on the
Flutter framework being fully initialized.
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //Initializes Firebase with the provided configuration options. This step is necessary before using any Firebase services.
      options: const FirebaseOptions(
          apiKey: "AIzaSyBh5jt-EJluy3aBIr4cw6jnLo4DJ7e9ozk",
          appId: "fir-flutter-ex-667d6",
          messagingSenderId: '',
          projectId: "fir-flutter-ex-667d6"));
  User? user = FirebaseAuth.instance.currentUser;
  //Retrieves the current authenticated user using the currentUser property of the FirebaseAuth instance.
  runApp(MaterialApp(
    home: user == null ? LoginFirebase() : const HomeFirebase(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginFirebase extends StatelessWidget {
  // const LoginFirebase({super.key});
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Here'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: emailController,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: passController,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  String email = emailController.text.trim();
                  String pass = passController.text.trim();

                  ///.trim() => The string without any leading and trailing whitespace.
                  ///If the string contains leading or trailing whitespace,
                  ///a new string with no leading and no trailing whitespace is returned:
                  FirebaseHelper()
                      .loginUser(email: email, pass: pass)
                      .then((value) {
                    if (value == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeFirebase()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(value)));
                    }
                  });
                },
                child: const Text('Login Now')),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationFirebase()));
                },
                child: const Text('Do not have an account?\nRegister Now'))
          ],
        ),
      ),
    );
  }
}
