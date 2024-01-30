import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: PermissionEx(),
  ));
}

class PermissionEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  askCameraPermission(context);
                },
                child: Text('CAmera')),
            ElevatedButton(
                onPressed: () {
                  askMultiplePermissions();
                },
                child: Text('Multiple Permissions')),
            ElevatedButton(
                onPressed: () {
                  openSettings();
                },
                child: Text('Settings')),
          ],
        ),
      ),
    );
  }

  void askCameraPermission(BuildContext context) async {
    var status = await Permission.camera.status;
    if (await Permission.camera.request().isGranted) {
      var picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Permission Denied")));
    }
  }

  void askMultiplePermissions() async {
    Map<Permission, PermissionStatus> status = await [
      Permission.location,
      Permission.contacts,
      Permission.photos,
      Permission.microphone,
      Permission.phone
    ].request();
    print(
        'Location ${status[Permission.location]} \ncamera ${status[Permission.phone]}');
  }

  void openSettings() async {
    openAppSettings();
  }
}
