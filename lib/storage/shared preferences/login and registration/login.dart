import 'package:advanced_flutter/storage/shared%20preferences/login%20and%20registration/home.dart';
import 'package:advanced_flutter/storage/shared%20preferences/login%20and%20registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPgSharedPref extends StatefulWidget {
  @override
  State<LoginPgSharedPref> createState() => _LoginPgSharedPrefState();
}

class _LoginPgSharedPrefState extends State<LoginPgSharedPref> {
  var formKey = GlobalKey<FormState>();
  var unameController = TextEditingController();
  var passController = TextEditingController();

  late SharedPreferences preferences;
  late bool newUser;

  @override
  void initState() {
    checkIfUserAlreadyLogin();
    super.initState();
  }

  void checkIfUserAlreadyLogin() async {
    preferences = await SharedPreferences.getInstance();
    // ?? if the given condition is null second statement will execute
    // the ley new-user will create only when we click on login button.. before that it will be null
    newUser = preferences.getBool('newUser') ?? true;

    if (newUser == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeSharedPref()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'UserName'),
                    validator: (uname) {
                      if (uname!.isEmpty || !uname.contains('@')) {
                        return 'invalid username';
                      } else {
                        return null;
                      }
                    },
                    controller: unameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Password'),
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return 'invalid password';
                      } else {
                        return null;
                      }
                    },
                    controller: passController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        var valid = formKey.currentState!.validate();
                        if (valid == true) {
                          validateInput();
                        }
                      },
                      child: const Text('Login')),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RegistrationPgSharedPref()));
                    },
                    child: const Text('Not a User?\nRegister Here'))
              ],
            )),
      ),
    );
  }

  void validateInput() async {
    String uname = unameController.text;
    String pass = passController.text;
    preferences = await SharedPreferences.getInstance();

    //if a user is loggedIn then mark it as not anew user
    preferences.setBool('newUser', false);

    //reading the registered values
    String? storedUname = preferences.getString('UserName');
    String? storedPass = preferences.getString('Pass');

    if (storedUname == uname && storedPass == pass) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeSharedPref()));
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPgSharedPref(),
    debugShowCheckedModeBanner: false,
  ));
}
