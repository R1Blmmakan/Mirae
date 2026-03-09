import 'package:flutter/material.dart';

class AboutusPage extends StatefulWidget {
  const AboutusPage({super.key});

  @override
  State<AboutusPage> createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutusPage> {

  String selectedMajor = "PPLG";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          // HEADER HIJAU
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

          // CONTENT
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
                      "Welcome To",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const Text(
                      "MAJOR",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // CHIP JURUSAN SCROLL
                    SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [

                          _chip("PPLG"),
                          const SizedBox(width: 10),

                          _chip("DKV"),
                          const SizedBox(width: 10),

                          _chip("CULINARY"),
                          const SizedBox(width: 10),

                          _chip("HOSPITALITY"),
                          const SizedBox(width: 10),

                          _chip("BUSINESS"),

                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "MEMBERS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),

          // JUDUL ABOUT US DI ATAS
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              left: 24,
            ),
            child: const Text(
              "About Us",
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

  Widget _chip(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMajor = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}