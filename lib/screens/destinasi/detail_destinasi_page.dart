import 'package:flutter/material.dart';
import 'dart:ui';

class DetailDestinasiPage extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String description;

  const DetailDestinasiPage({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9CAB84),
      body: Stack(
        children: [

          const Positioned(
            top: 50,
            left: 20,
            child: Text(
              "Tourism",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(height: 100),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7EBEF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Welcome To",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        height: 460,
                        child: Stack(
                          children: [

                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                image,
                                width: double.infinity,
                                height: 460,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              top: 15,
                              left: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 20,
                              left: 20,
                              right: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white.withOpacity(0.25),
                                      borderRadius:
                                          BorderRadius.circular(18),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 5),

                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              location,
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16),
                          const SizedBox(width: 4),
                          Text(location),
                        ],
                      ),

                      const SizedBox(height: 15),

                      Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}