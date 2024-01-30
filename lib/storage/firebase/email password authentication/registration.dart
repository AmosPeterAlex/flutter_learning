import 'package:advanced_flutter/storage/firebase/email%20password%20authentication/firebase_functions.dart';
import 'package:advanced_flutter/storage/firebase/email%20password%20authentication/login.dart';
import 'package:flutter/material.dart';

class RegistrationFirebase extends StatelessWidget {
  // const RegistrationFirebase({super.key});
  var emailController = TextEditingController();
  var passController = TextEditingController();

  // var cPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Now'),
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
            // TextField(
            //     controller: cPassController,
            //     style: TextStyle(fontSize: 20),
            //     decoration: InputDecoration(
            //         hintText: 'Confirm Password',
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10)))),
            // SizedBox(
            //   height: 10,
            // ),
            ElevatedButton(
                onPressed: () {
                  String email = emailController.text.trim();
                  String pass = passController.text.trim();
                  FirebaseHelper()
                      .registerUser(email: email, pass: pass)
                      .then((value) {
                    if (value == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginFirebase()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(value)));
                    }
                  });
                },
                child: const Text('Register Now')),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginFirebase()));
                },
                child: const Text('Already have an account?\nLogin Now'))
          ],
        ),
      ),
    );
  }
}
