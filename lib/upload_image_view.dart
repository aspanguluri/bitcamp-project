import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadImageView extends StatefulWidget {
  const UploadImageView({super.key});

  @override
  State<UploadImageView> createState() => _UploadImageViewState();
}

class _UploadImageViewState extends State<UploadImageView> {
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
                    const SizedBox(
                      height: 500,
                      width: 250,
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: [],
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
                            //TODO: Insert page route to instructions page
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
