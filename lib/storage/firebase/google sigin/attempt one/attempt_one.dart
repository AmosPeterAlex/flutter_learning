import 'package:advanced_flutter/storage/firebase/google%20sigin/attempt%20one/functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBh5jt-EJluy3aBIr4cw6jnLo4DJ7e9ozk",
          appId:
              "342843819105-tja51e801s6vi3j1og9vqp4dnvsfh0lp.apps.googleusercontent.com",
          messagingSenderId: '',
          projectId: "fir-flutter-ex-667d6",
          storageBucket: "fir-flutter-ex-667d6.appspot.com"));
  runApp(MaterialApp(
    home: LoginGoogle(),
  ));
}

class LoginGoogle extends StatelessWidget {
  // const LoginGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                NewGSignIn().signInWithGoogle();


              },
              child: Text('Login with\n Google'),
            )
          ],
        ),
      ),
    );
  }
}
