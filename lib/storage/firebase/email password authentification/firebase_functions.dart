import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

//user SignUp
  Future<String?> registerUser(
      {required String email, required String pass}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      // return null;
    } on FirebaseAuthException catch (e) {
      // return e.message;
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    // try {
    //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: emailAddress,
    //     password: password,
    //   );
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  //user Login

  Future<String?> loginUser(
      {required String email, required String pass}) async {
    try {
     await auth.signInWithEmailAndPassword(email: email, password: pass);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.message;
    }
    // try {
    //  await auth.createUserWithEmailAndPassword(
    //     email: email,
    //     password: pass,
    //   );
    //   return null;
    // } on FirebaseAuthException catch (e) {
    //   return e.message;
    // } catch (e) {
    //   print(e);
    // }
  }
}
