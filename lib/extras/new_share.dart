import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class SharePdfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share PDF'),
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onLongPress: () => _sharePdf(context),
              onTap: () {
                //pdf open akan ola command idenm
              },
            ),
            // ElevatedButton(
            //   onPressed: () => _sharePdf(context),
            //   child: Text('Share PDF'),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _sharePdf(BuildContext context) async {
    try {
      // Get the directory where the PDF file is located
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/example.pdf';

      // Copy the PDF file from assets to the application directory
      ByteData data = await rootBundle.load('assets/example.pdf');
      List<int> bytes = data.buffer.asUint8List();
      File file = File(filePath);
      await file.writeAsBytes(bytes);

      // Share the PDF file
      final result = await Share.shareXFiles(
        [XFile(filePath)],
        text: 'Great PDF',
      );

      if (result.status == ShareResultStatus.success) {
        print('Thank you for sharing the PDF!');
      } else {
        print('Failed to share the PDF.');
      }
    } catch (e) {
      print('Error sharing PDF: $e');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: SharePdfScreen(),
  ));
}
