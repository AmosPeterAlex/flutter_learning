import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseCRUDEx extends StatefulWidget {
  const FirebaseCRUDEx({super.key});

  @override
  State<FirebaseCRUDEx> createState() => _FirebaseCRUDExState();
}

class _FirebaseCRUDExState extends State<FirebaseCRUDEx> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  late CollectionReference _userCollection;

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection('users');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Cloud Storage Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  addUser();

                  ///User should be added
                },
                child: const Text('Add User')),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: getUser(),

                ///data should be received from cloud
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  final users = snapshot.data!.docs;
                  return Expanded(
                      child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            final userID = user.id;
                            final userName = user['name'];
                            final userEmail = user['email'];
                            return ListTile(
                              title: Text('$userName'),
                              subtitle: Text('$userEmail'),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        editData(userID);
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        deleteData(userID);
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            );
                          }));
                })
          ],
        ),
      ),
    );
  }

//create user
  Future<void> addUser() async {
    return _userCollection
        .add({'name': nameController.text, 'email': emailController.text}).then(
            (value) {
      print("user added Successfully");
      nameController.clear();
      emailController.clear();
    }).catchError((error) {
      print("failed to add user $error");
    });
  }

//read user
  Stream<QuerySnapshot> getUser() {
    return _userCollection.snapshots();
  }

  //edit user
  void editData(id) {
    showDialog(
        context: context,
        builder: (context) {
          var nameEController = TextEditingController();
          var emailEController = TextEditingController();
          return AlertDialog(
            title: const Text('Update User'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: nameEController,
                    decoration: const InputDecoration(
                        hintText: "Enter Text", border: OutlineInputBorder())),
                SizedBox(
                  height: 5,
                ),
                TextField(
                    controller: emailEController,
                    decoration: const InputDecoration(
                        hintText: "Enter Text", border: OutlineInputBorder()))
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    updateUser(id, nameEController.text, emailEController.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Update'))
            ],
          );
        });
  }

//update user data
  Future<void> updateUser(var id, String newName, String newEmail) async {
    return _userCollection
        .doc(id)
        .update({'name': newName, 'email': newEmail}).then((value) {
      print('User Updated Successfully');
    }).catchError((error) {
      print('User Data Updation Failed');
    });
  }

  // void deleteData() {}
  Future<void> deleteData(var id) {
    return _userCollection.doc(id).delete().then((value) {
      print("User Deleted Successfully");
    }).catchError((error) {
      print("User deletion failed $error");
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBh5jt-EJluy3aBIr4cw6jnLo4DJ7e9ozk",
          appId: "fir-flutter-ex-667d6",
          messagingSenderId: '',
          projectId: "fir-flutter-ex-667d6",
          storageBucket: "fir-flutter-ex-667d6.appspot.com"));
  runApp(const MaterialApp(
    home: FirebaseCRUDEx(),
    debugShowCheckedModeBanner: false,
  ));
}
