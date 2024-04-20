import 'dart:io';
import 'dart:ui';

import 'package:bitcamp_project/instructions_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageView extends StatefulWidget {
  const UploadImageView({super.key});

  @override
  State<UploadImageView> createState() => _UploadImageViewState();
}

class _UploadImageViewState extends State<UploadImageView> {
  Future<File?> _handleFileUpload(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if ((result != null)) {
      if (result.files.isNotEmpty) {

          File file = File(result.files.first.name);
          // print('Selected file: ${file.path}');
          return file;

      } else {
        print('The file is empty');
        return null;
      }
    } else {
      print('No file selected');
      return null;
    }
  }

  Future<File?> _handleCameraImageUpload(BuildContext context) async {
    try {
      XFile? picked = await ImagePicker().pickImage(source: ImageSource.camera);
      if (picked != null) {
        File file = File(picked.name);
        //print('Captured image: ${file.path}');
        return file;
      } else {
        print('Canceled the photo');
        return null;
      }
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/cropland_background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "What Crops Should I Grow In My Soil?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Upload an image of soil:",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 500,
                      width: 250,
                      child: Card(
                        color: Colors.white.withOpacity(0.7),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: Card(
                                  color: Colors.white,
                                  child: TextButton(
                                    onPressed: () =>
                                          _handleFileUpload(context),

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.file_upload,
                                          color: Colors.brown,
                                          size: 50.0,
                                        ),
                                        Text(
                                          "Upload a file",
                                          style: GoogleFonts.poppins(
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      indent: 5.0,
                                      endIndent: 5.0,
                                      thickness: 2.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "or",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      indent: 5.0,
                                      endIndent: 5.0,
                                      thickness: 2.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 200,
                                child: Card(
                                  color: Colors.white,
                                  child: TextButton(
                                    onPressed: () =>
                                        _handleCameraImageUpload(context),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.camera_alt,
                                          color: Colors.brown,
                                          size: 50.0,
                                        ),
                                        Text(
                                          "Take a Picture",
                                          style: GoogleFonts.poppins(
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 65, 49, 3),
                        ),
                      ),
                      onPressed: () {
                        //TODO: fill in the on-pressed behavior
                      },
                      child: Text(
                        "Check My Soil!",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          alignment: Alignment.topRight,
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InstructionsView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
