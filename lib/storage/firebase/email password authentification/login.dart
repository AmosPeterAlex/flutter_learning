import 'package:advanced_flutter/storage/firebase/email%20password%20authentification/home.dart';
import 'package:advanced_flutter/storage/firebase/email%20password%20authentification/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_functions.dart';

class LoginFirebase extends StatelessWidget {
  // const LoginFirebase({super.key});
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Here'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: emailController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: passController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  String email = emailController.text.trim();
                  String pass = passController.text.trim();
                  FirebaseHelper()
                      .loginUser(email: email, pass: pass)
                      .then((value) {
                    if (value == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeFirebase()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(value)));
                    }
                  });
                },
                child: Text('Login Now')),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationFirebase()));
                },
                child: Text('Dont have an account?\nRegister Now'))
          ],
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //external storages add cheynm enkil edh il engaene initilaisation cheyanm
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBh5jt-EJluy3aBIr4cw6jnLo4DJ7e9ozk",
          appId: "fir-flutter-ex-667d6",
          messagingSenderId: '',
          projectId: "fir-flutter-ex-667d6"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? LoginFirebase() : HomeFirebase(),
    debugShowCheckedModeBanner: false,
  ));
}
