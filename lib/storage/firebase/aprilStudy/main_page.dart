import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //Initializes Firebase with the provided configuration options. This step is necessary before using any Firebase services.
    options: const FirebaseOptions(
        apiKey: "AIzaSyBh5jt-EJluy3aBIr4cw6jnLo4DJ7e9ozk",
        appId: "fir-flutter-ex-667d6",
        messagingSenderId: '',
        projectId: "fir-flutter-ex-667d6"),
  );
  // User? user = FirebaseAuth.instance.currentUser;
  //Retrieves the current authenticated user using the currentUser property of the FirebaseAuth instance.
  runApp(MaterialApp(
    home: FirebaseApril(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirebaseApril extends StatefulWidget {
  @override
  State<FirebaseApril> createState() => _FirebaseAprilState();
}

class _FirebaseAprilState extends State<FirebaseApril> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("students");
  var nameC = TextEditingController();
  var phC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App bar"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameC,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phC,
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          MaterialButton(
            color: Colors.amber,
            child: Text("Add "),
            onPressed: () {
              // log(snapshot.data!.docs[index].id);
              // Add a new document with a generated id.
              final data = {"name": nameC.text, "ph": phC.text};

              collectionReference.add(data).then((documentSnapshot) =>
                  print("Added Data with ID: ${documentSnapshot.id}"));
              nameC.clear();
              phC.clear();
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: collectionReference.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("has error");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data!.docs[index]["name"]),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // log(snapshot.data!.docs[index].id);
                              // Add a new document with a generated id.
                              final data = {"name": nameC.text, "ph": phC.text};

                              collectionReference
                                  .doc(snapshot.data!.docs[index].id)
                                  .update(data)
                                  .then((value) {
                                // debug msg
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // final data = {"name": nameC.text, "ph": phC.text};

                              collectionReference
                                  .doc(snapshot.data!.docs[index].id)
                                  .delete()
                                  .then((value) {
                                // debug msg
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
