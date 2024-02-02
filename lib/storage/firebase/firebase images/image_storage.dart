import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

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
    home: FirebaseImageStorage(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirebaseImageStorage extends StatefulWidget {
  const FirebaseImageStorage({super.key});

  @override
  State<FirebaseImageStorage> createState() => _FirebaseImageStorageState();
}

class _FirebaseImageStorageState extends State<FirebaseImageStorage> {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Store'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                    onPressed: () => upload("camera"),
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text('Camera')),
                ElevatedButton.icon(
                    onPressed: () => upload("gallery"),
                    icon: const Icon(Icons.photo),
                    label: const Text('Gallery'))
              ],
            ),
          ),
          // Expanded(child: StreamBuilder(stream: loadMedia(), builder: builder))
          //Change this to streamBuilder  then wrap with something
          Expanded(
              child: FutureBuilder(
                  future: loadMedia(),
                  //images returned from method
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final image = snapshot.data![index];
                          return Card(
                            child: ListTile(
                              leading: Image.network(image['imageUrl']),
                              title: Text(image["uploadedBy"]),
                              subtitle: Text(image['time']),
                              trailing: IconButton(
                                  onPressed: () => deleteMedia(image['path']),
                                  icon: const Icon(Icons.delete)),
                            ),
                          );
                        },
                        itemCount: snapshot.data?.length ?? 0,
                      );
                    }
                    return CircularProgressIndicator();
                  }))
        ],
      ),
    );
  }

  ///upload image to firebase
  Future<void> upload(String imageFrom) async {
    final picker = ImagePicker();
    XFile? pickedImage; //Used for cross platform

    try {
      pickedImage = await picker.pickImage(
          source:
              imageFrom == "camera" ? ImageSource.camera : ImageSource.gallery);
      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);
      try {
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              "uploadedBy": "phoneName",
              'time': '${DateTime.now()}'
            }));
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (error) {
      print(error);
    }
  }

  /*
  Future<void> upload(String imageFrom) async {
  final picker = ImagePicker();
  XFile? pickedImage; // Used for cross-platform

  try {
    // Pick an image from the camera or gallery based on 'imageFrom'
    pickedImage = await picker.pickImage(
        source: imageFrom == "camera" ? ImageSource.camera : ImageSource.gallery);

    // Get the file name and create a File object from the picked image
    final String fileName = path.basename(pickedImage!.path);
    File imageFile = File(pickedImage.path);

    try {
      // Upload the image to Firebase Storage with custom metadata
      await storage.ref(fileName).putFile(
        imageFile,
        SettableMetadata(customMetadata: {
          "uploadedBy": "phoneName",
          'time': '${DateTime.now()}',
        }),
      );
    } on FirebaseException catch (error) {
      // Handle Firebase storage exceptions
      print(error);
    }
  } catch (error) {
    // Handle other exceptions, e.g., if the user cancels image picking
    print(error);
  }
}

   */

  ///load images from firebase
  Future<List<Map<String, dynamic>>> loadMedia() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref().list(); //11.54refer
    final List<Reference> allFiles = result.items;
    await Future.forEach(allFiles, (singleFile) async {
      final String fileUrl = await singleFile.getDownloadURL();
      final FullMetadata metadata = await singleFile
          .getMetadata(); //angot settable metadata vech ayiurnn, but engot FullMetadata vech aa edukunna
      images.add({
        'imageUrl': fileUrl,
        'path': singleFile.fullPath,
        'uploadedBy': metadata.customMetadata?['uploadedBy'] ?? "no Data",
        'time': metadata.customMetadata?['time'] ?? "NO Time Found"
      });
    }); //12.07
    // setState(() {});
    return images;
  }

/*
  Future<List<Map<String, dynamic>>> loadMedia() async {
  List<Map<String, dynamic>> images = [];

  // Retrieve a list of all files in the root directory of Firebase Storage
  final ListResult result = await storage.ref().list();
  final List<Reference> allFiles = result.items;

  // Iterate through each file and gather information
  await Future.forEach(allFiles, (singleFile) async {
    // Get the download URL of the file
    final String fileUrl = await singleFile.getDownloadURL();

    // Get the metadata of the file
    final FullMetadata metadata = await singleFile.getMetadata();

    // Add information about the file to the 'images' list
    images.add({
      'imageUrl': fileUrl,
      'path': singleFile.fullPath,
      'uploadedBy': metadata.customMetadata?['uploadedBy'] ?? "no Data",
      'time': metadata.customMetadata?['time'] ?? "NO Time Found",
    });
  });

  return images;
}

 */

  ///delete from firebase
  Future<void> deleteMedia(String imagePath) async {
    await storage.ref(imagePath).delete();
    setState(() {});
  }
}
