import 'package:flutter/material.dart';

class UploadImageView extends StatelessWidget {
  const UploadImageView({super.key});

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
      body: const Center(
        child: Text(
          "upload an image",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
