import 'package:flutter/material.dart';
import 'dart:ui';

class CulturePage extends StatelessWidget {
  const CulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Culture",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFEDEDED),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 30),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome To", style: TextStyle(fontSize: 18)),
                        SizedBox(height: 5),
                        Text(
                          "Culture",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  Stack(
                    children: [

                      Column(
                        children: [
                          Image.asset(
                            "assets/img/wadi.webp",
                            height: 241,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/img/wadi.webp",
                            height: 310,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),

                      Positioned(
                        top: 220,
                        left: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha:0.25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Food & Drink",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Positioned(
                        bottom: 60,
                        left: 25,
                        child: Text(
                          "Samboosa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 12,
                        left: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 9,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "More",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        _smallCard("assets/img/wadi.webp"),
                        const SizedBox(width: 6),
                        _smallCard("assets/img/wadi.webp"),
                        const SizedBox(width: 6),
                        _smallCard("assets/img/wadi.webp"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Samboosa",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF947D49),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "A traditional Middle Eastern snack shaped like a triangle, similar to a samosa, and very popular in Gulf countries such as the United Arab Emirates, Saudi Arabia, and Kuwait.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),


                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Color(0xFF947D49),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "RELIGION",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF947D49),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Color(0xFF947D49),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:Row(
                      children: [
                    
                        religionCard(
                          "assets/img/mosque.webp",
                          "ISLAM",
                          const Color(0xFF9C5A24),
                          const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                    
                        religionCard(
                          "assets/img/mosque.webp",
                          "CHRISTIANITY",
                          const Color(0xFFD2B48C),
                          const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                    
                        const SizedBox(width: 50),
                    
                        religionCard(
                          "assets/img/mosque.webp",
                          "BUDDHISM",
                          const Color(0xFF9C5A24),
                          const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                    
                        religionCard(
                          "assets/img/mosque.webp",
                          "HINDUISM",
                          const Color(0xFFD2B48C),
                          const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                    
                      ],
                    )
                  ),
                  
                  const SizedBox(height: 30),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Color(0xFF947D49),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "TRADITION",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF947D49),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Color(0xFF947D49),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  _traditionCard(
                    "assets/img/mosque.webp",
                    "Al-Ayala",
                    "Traditional dance performed during celebrations.",
                  ),

                  _traditionCard(
                    "assets/img/mosque.webp",
                    "Falconry",
                    "Traditional hunting using falcons.",
                  ),

                  _traditionCard(
                    "assets/img/mosque.webp",
                    "Camel Racing",
                    "Popular desert sport in the UAE.",
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  
                      Container(
                        width: 110,
                        height: 2,
                          color: Color(0xFF947D49),
                        ),
                  
                      const SizedBox(width: 10),
                  
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "TRADITIONAL",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF947D49),
                            ),
                          ),
                          Text(
                            "CLOTHING",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF947D49),
                            ),
                          ),
                        ],
                      ),
                  
                      const SizedBox(width: 10),
                  
                      Container(
                        width: 110,
                        height: 2,
                        color: Color(0xFF947D49),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _traditionCard(String image, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    desc,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  static Widget _smallCard(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        image,
        width: 120,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

Widget religionCard(
    String image,
    String title,
    Color color,
    BorderRadius radius,
) {
  return Container(
    width: 80,
    height: 90,
    decoration: BoxDecoration(
      color: color,
      borderRadius: radius,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Image.asset(
              image,
              height: 24,
            ),
          ),
        ),

        const SizedBox(height: 5),

        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
} 