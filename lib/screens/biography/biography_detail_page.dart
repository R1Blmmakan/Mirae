import 'package:flutter/material.dart';

class BiographyDetailPage extends StatelessWidget {
  final String image;
  final String name;
  final String description;

  const BiographyDetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
        
            /// GAMBAR + BACK
            Stack(
              children: [
        
                Image.asset(
                  image,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
        
            /// CONTAINER PUTIH
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFE9ECEF),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        
                  const SizedBox(height: 20),
        
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
        
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}