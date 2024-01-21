import 'dart:developer';

import 'package:advanced_flutter/storage/firebase/phone%20firebase/home_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String verificationID;

  const OTPScreen({super.key, required this.verificationID});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    var otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'OTP',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(
                          verificationId: widget.verificationID,
                          smsCode: otpController.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePhoneVerif()));
                  });
                } catch (ex) {
                  log(ex.toString());
                }
              },
              child: const Text('OTP Verify'))
        ],
      ),
    );
  }
}
