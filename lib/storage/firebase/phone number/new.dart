// import 'package:firebase_auth/firebase_auth.dart';
//
// class PhoneNumberFirebase {
//   //verify phone number
//   Future<void> verifyPhNo() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '+919633780485',
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {},
//       codeSent: (String verificationId, int? resendToken) {},
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
//   Future<void> verifyPhSucc async {
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   await auth.verifyPhoneNumber(
//   phoneNumber: '+44 7123 123 456',
//   verificationCompleted: (PhoneAuthCredential credential) async {
//   // ANDROID ONLY!
//
//   // Sign the user in (or link) with the auto-generated credential
//   await auth.signInWithCredential(credential);
//   },
//   );
//   }
//   Future<void> verifyFailed{
// FirebaseAuth auth = FirebaseAuth.instance;
//
// await auth.verifyPhoneNumber(
// phoneNumber: '+44 7123 123 456',
// verificationFailed: (FirebaseAuthException e) {
// if (e.code == 'invalid-phone-number') {
// print('The provided phone number is not valid.');
// }
//
// // Handle other errors
// },
// );
// }
// }
