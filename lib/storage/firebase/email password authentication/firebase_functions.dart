import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => auth.currentUser;

///user SignUp
  Future<String?> registerUser(
      {required String email, required String pass}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      // return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
    return null;
  }

  ///user Login

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
  }

///signOut

Future<void> logOut() async{
  await auth.signOut();
}
}
