import 'package:advanced_flutter/storage/shared%20preferences/login%20and%20registration/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSharedPref extends StatefulWidget {
  // const HomeSharedPref({super.key});

  @override
  State<HomeSharedPref> createState() => _HomeSharedPrefState();
}

class _HomeSharedPrefState extends State<HomeSharedPref> {
  late SharedPreferences preferences;
  String? uname;

  // override advice vech remove aaki

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      uname = preferences.getString('UserName')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('Hi $uname !'),
      ),
      body: Center(
          child: TextButton(
              onPressed: () {
                preferences.setBool('newUser', true);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPgSharedPref()));
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => LoginPgSharedPref()));

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LoginPgSharedPref()));
              },
              child: const Text('Log out'))),
    );
  }
}
