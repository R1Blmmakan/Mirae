import 'package:flutter/material.dart';

class BiographyDetailPage extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String role;
  final String avatar;

  const BiographyDetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.role,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              const SizedBox(height: 35),
        
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Biography",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        
              const SizedBox(height: 20),
        
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFE9ECEF),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
        
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome To",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
        
                    const SizedBox(height: 15),
        
                    Stack(
                      children: [
        
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            image,
                            height: 400,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
        
                        Positioned(
                          top: 15,
                          left: 15,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 15,
                          right: 15,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                    
                                Text(
                                  name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                    
                                const SizedBox(height: 3),
                    
                                Text(
                                  role,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                    
                              ],
                            ),
                          ),
                        ),
        
                      ],
                    ),
        
                    const SizedBox(height: 25),
        
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
        
                          Row(
                            children: [
        
                              CircleAvatar(
                                radius: 14,
                                backgroundImage: AssetImage(avatar),
                              ),
        
                              const SizedBox(width: 10),
        
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "About $name",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                          const SizedBox(height: 10),
        
                          Text(
                            description,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
        
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}