import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


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
    home: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginIn(),
    );
  }
}


class LoginIn extends StatefulWidget {
  LoginIn({Key? key}) : super(key: key);


  @override
  State<LoginIn> createState() => _LoginInState();
}


class _LoginInState extends State<LoginIn> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isLoggedIn
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(_userObj.photoUrl!),
              const SizedBox(height: 20,),
              Text(_userObj.displayName!),
              const SizedBox(height: 20,),
              Text(_userObj.email),
              const SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  _googleSignIn.signOut().then((value) {
                    setState(() {
                      _isLoggedIn = false;
                    });
                  }).catchError((e) {});
                },
                height: 50,
                minWidth: 100,
                color: Colors.red,
                child: const Text('Logout',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ) : Center(
            child: MaterialButton(
              onPressed: () {
                _googleSignIn.signIn().then((userData) {
                  setState(() {
                    _isLoggedIn = true;
                    _userObj = userData!;
                  });
                }).catchError((e) {
                  print(e);
                });
              },
              height: 50,
              minWidth: 100,
              color: Colors.red,
              child: const Text('Google Signin',style: TextStyle(color: Colors.white),),
            )
        ),
      ),
    );
  }
}
