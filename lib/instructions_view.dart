import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/apple-orchard.jpeg"),
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
                    const SizedBox(height: 50),
                    Expanded(
                      child: Card(
                        color: Colors.white.withOpacity(0.3),
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "What Does This Application Do?",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '''We are committed towards sustainable environmental practices and this application centers on applying those principles to agriculture and gardening.
                                \nTo utilize this application, take a photograph of a plot of soil and upload it appropriately.
                                \nThis software will then inform you as to which variety of soil it is and what crops would be most suitable to grow for the carbon cycle, low emissions, and soil health.''',
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Colors.black,
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
        ),
      ),
    );
  }
}
