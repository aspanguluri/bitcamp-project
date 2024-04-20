import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadImageView2 extends StatelessWidget {
  const UploadImageView2({Key? key}) : super(key: key);

  Future<void> _handleFileUpload(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if ((result != null)) {
      if (result.files.isNotEmpty) {
        if (result.files?.single?.path != null) {
          File file = File(result.files!.single.path ?? '');
          print('Selected file: ${file.path}');
        } else {
          print('Not a valid file path');
        }
      } else {
        print('The file is empty');
      }
    } else {
      print('No file selected');
    }
  }

  Future<void> _handleCameraImageUpload(BuildContext context) async {
    try {
      XFile? picked = await ImagePicker().pickImage(source: ImageSource.camera);
      if (picked != Null) {
        File file = File(picked!.path);
        print('Captured image: ${file.path}');
      } else {
        print('Canceled the photo');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upload Image",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () => _handleFileUpload(context),
                      icon: Icon(Icons.file_upload),
                      label: Text("Upload a file")),
                  ElevatedButton.icon(
                    onPressed: () => _handleCameraImageUpload(context),
                    icon: Icon(Icons.camera_alt),
                    label: Text("Take Picture"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
