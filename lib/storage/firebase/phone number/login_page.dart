import 'package:advanced_flutter/storage/firebase/phone%20number/firebase_phone.dart';
import 'package:advanced_flutter/storage/firebase/phone%20number/new.dart';
import 'package:flutter/material.dart';

class PhoneNoLogin extends StatelessWidget {
  // const PhoneNoLogin({super.key});
  var nameController = TextEditingController();
  var phController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone number Verifiaction'),
      ),
      body: Column(
        children: [
          TextField(
              controller: nameController,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)))),
          TextField(
              controller: phController,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)))),
          ElevatedButton(
              onPressed: () {
                String phoneNo=phController.text.trim();
                PhoneNumberFirebase().verifyPhNo();
              },
              child: Text('Verify'))
        ],
      ),
    );
  }
}
