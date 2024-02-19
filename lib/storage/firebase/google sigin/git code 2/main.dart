import 'package:advanced_flutter/storage/firebase/google%20sigin/git%20code%202/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //Initializes Firebase with the provided configuration options. This step is necessary before using any Firebase services.
      options: const FirebaseOptions(
          apiKey: "AIzaSyBh5jt-EJluy3aBIr4cw6jnLo4DJ7e9ozk",
          appId: "fir-flutter-ex-667d6",
          messagingSenderId: '',
          projectId: "fir-flutter-ex-667d6"));
  // User? user = FirebaseAuth.instance.currentUser;
  //Retrieves the current authenticated user using the currentUser property of the FirebaseAuth instance.
  runApp(MaterialApp(
    home: SignInDemo(),
    debugShowCheckedModeBanner: false,
  ));
}


class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (error) {
      print(error);
      return null;
    }
  }

  void _navigateToHome(User? user) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign in with Google'),
          onPressed: () async {
            UserCredential? userCredential = await _handleSignIn();
            if (userCredential != null) {
              print('Successfully signed in with Google: ${userCredential.user!.displayName}');
              _navigateToHome(userCredential.user);
            } else {
              print('Google Sign-In failed');
            }
          },
        ),
      ),
    );
  }
}