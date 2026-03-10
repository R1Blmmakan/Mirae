import 'package:flutter/material.dart';
import 'dart:ui';
import 'biography_detail_page.dart';

class BiographyPage extends StatelessWidget {
  const BiographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A),
      body: Stack(
        children: [
      
          Positioned(
            top: MediaQuery.of(context).padding.top + 30,
            left: 20,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Biography",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 110),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFE9ECEF),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  const SizedBox(height: 30),
      
                  const Text(
                    "Welcome To",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
      
                  const Text(
                    "Biography",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      
                  const SizedBox(height: 30),
      
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.8,
                    children: const [
                      BioCard(
                        image: "assets/img/mosque.webp",
                        name: "Sarah Al-Amiri",
                      ),
      
                      BioCard(
                        image: "assets/img/mosque.webp",
                        name: "Khalaf Ahmed\nAl-Habtoor",
                      ),
      
                      BioCard(
                        image: "assets/img/mosque.webp",
                        name: "Khulood Atiq",
                      ),
      
                      BioCard(
                        image: "assets/img/mosque.webp",
                        name: "Ashwaq Abdulla",
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 20),
      
                  Center(
                    child: SizedBox(
                      height: 240,
                      width: 190,
                      child: const BioCard(
                        image: "assets/img/mosque.webp",
                        name: "Majid Al-Futtaim",
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 40),
      
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BioCard extends StatelessWidget {
  final String image;
  final String name;

  const BioCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withValues(alpha: 0.6),
                Colors.transparent
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 60,
          left: 15,
          right: 15,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFFFD400),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        Positioned(
          bottom: 15,
          left: 15,
          right: 15,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BiographyDetailPage(
                    image: image,
                    name: name,
                    description: "Isi biography orang ini...",
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "See More",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}