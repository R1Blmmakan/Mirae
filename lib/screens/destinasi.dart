import 'package:flutter/material.dart';
import 'dart:ui';

class DestinasiPage extends StatefulWidget {
  const DestinasiPage({super.key});

  @override
  State<DestinasiPage> createState() => _DestinasiPageState();
}

class _DestinasiPageState extends State<DestinasiPage> {
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 350), () {
      if (mounted) {
        setState(() {
          _isReady = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF9CAB84),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),

          // CONTENT SCROLL
          ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(height: 90),

              Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "United Emirates Arab",
                      style: TextStyle(fontSize: 16),
                    ),

                    const Text(
                      "Destinations",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: !_isReady
                          ? const SizedBox(height: 320)
                          : SingleChildScrollView(
                              key: const ValueKey('heavy_content_1'),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  _buildLargeCard(
                                    'assets/img/airport.webp',
                                    'Zayed International Airport',
                                    'Abu Dhabi, UEA',
                                  ),
                                  const SizedBox(width: 15),
                                  _buildLargeCard(
                                    'assets/img/mosque.webp',
                                    'Sheikh Zayed Grand Mosque',
                                    'Abu Dhabi, UEA',
                                  ),
                                  const SizedBox(width: 15),
                                  _buildLargeCard(
                                    'assets/img/burj_khalifa.webp',
                                    'Burj Khalifa',
                                    'Dubai, UEA',
                                  ),
                                  const SizedBox(width: 15),
                                  _buildLargeCard(
                                    'assets/img/gurunnanak.webp',
                                    'Gurun Nanak Darbar Sikh Temple',
                                    'Abu Dhabi, UEA',
                                  ),
                                ],
                              ),
                            ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Popular Destination",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: !_isReady
                          ? const SizedBox(height: 100)
                          : SingleChildScrollView(
                              key: const ValueKey('heavy_content_2'),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  _buildSmallCard('assets/img/mosque.webp'),
                                  const SizedBox(width: 15),
                                  _buildSmallCard('assets/img/burj_khalifa.webp'),
                                  const SizedBox(width: 15),
                                  _buildSmallCard('assets/img/mosque.webp'),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              left: 24,
            ),
            child: const Text(
              "Destinations",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeCard(String imagePath, String title, String location) {
    return RepaintBoundary(
      child: Container(
        width: 270,
        height: 405,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: ResizeImage(
              AssetImage(imagePath),
              width: 440,
              height: 640,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
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
    );
  }

  Widget _buildSmallCard(String imagePath) {
    return RepaintBoundary(
      child: Container(
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: ResizeImage(
              AssetImage(imagePath),
              width: 300,
              height: 200,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}