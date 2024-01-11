import 'package:advanced_flutter/storage/sqlite_db/login%20and%20registration/sqlite_functions.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  // const AdminHome({super.key});
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  void getAllUsers() async {
    var usersFromDB = await SQLFunctions.getAllUsersFromDB();
    setState(() {
      users = usersFromDB;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: const Text('Admin Home'),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  //keys are same as column names in table
                  title: Text(users[index]['name']),
                  subtitle: Text(users[index]['email']),
                  trailing: IconButton(
                      onPressed: () {
                        deleteDataByAdmin(users[index]['id']);
                      },
                      icon: Icon(Icons.delete)),
                ),
              );
            }));
  }

  void deleteDataByAdmin(int id) async {
    await SQLFunctions.deleteDataFromDB(id);
    getAllUsers(); //to refresh the UI or list
  }
}
