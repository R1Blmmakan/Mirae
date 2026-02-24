import 'package:flutter/material.dart';
import 'dart:ui';

class DestinasiPage extends StatelessWidget {
  const DestinasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFFC5D1B5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
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

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "United Emirates Arab",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "Destinations",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      _buildLargeCard(
                        'assets/img/airport.jpeg',
                        'Zayed International Airport',
                        'Abu Dhabi, UEA',
                      ),
                      const SizedBox(width: 15),
                      _buildLargeCard(
                        'assets/img/mosque.jpeg',
                        'Sheikh Zayed Grand Mosque',
                        'Abu Dhabi, UEA',
                      ),
                      const SizedBox(width: 15),
                      _buildLargeCard(
                        'assets/img/burj_khalifa.jpeg',
                        'Burj Khalifa',
                        'Dubai, UEA',
                      ),
                      const SizedBox(width: 15),
                      _buildLargeCard(
                        'assets/img/gurunnanak.jpeg',
                        'Gurun Nanak Darbar Sikh Temple',
                        'Abu Dhabi, UEA',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                const Text(
                  "Popular Destination",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      _buildSmallCard('assets/img/mosque.jpeg'),
                      const SizedBox(width: 15),
                      _buildSmallCard('assets/img/burj_khalifa.jpeg'),
                      const SizedBox(width: 15),
                      _buildSmallCard('assets/img/mosque.jpeg'),
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

  Widget _buildLargeCard(String imagePath, String title, String location) {
    return Container(
      width: 220,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
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
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
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
    );
  }

  Widget _buildSmallCard(String imagePath) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}

Widget buildLargeCard(String imagePath, String title, String location) {
  return Container(
    width: 200,
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
    ),
    child: Stack(
      children: [
        Positioned(
          bottom: 15,
          left: 15,
          right: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
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
  );
}



