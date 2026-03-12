import 'package:flutter/material.dart';
import 'dart:ui';
import 'biography_detail_page.dart';

class BiographyPage extends StatelessWidget {
  const BiographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "Biography",
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
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
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

                  const SizedBox(height: 5),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.75,
                    children: const [

                      BioCard(
                        image: "assets/img/bio1.webp",
                        name: "Sarah Al-Amiri",
                        role: "Technology",
                        avatar: "assets/img/bio1.webp",
                        descripton: "Sarah bint Yousef Al Amiri is a scientist and technology leader from the United Arab Emirates who is known as the lead scientist of the Emirates Mars Mission (Hope Probe), which successfully reached Mars orbit in 2020. With a background in computer engineering, she has made major contributions to the development of space technology and has promoted STEM education and innovation.",
                      ),

                      BioCard(
                        image: "assets/img/bio2.webp",
                        name: "Khalaf Ahmed Al-Habtoor",
                        role: "Hospitality",
                        avatar: "assets/img/bio2.webp",
                        descripton: "Khalaf Ahmad Al Habtoor was from Dunai. Early on his life was always humble. He also built the Al Habtoor Engineering in 1970. Khalaf was known for its luxurious 5-star hotels that are recognized, one of them was called as a 7-star hotel is the Burj Al Arab. Not only that, he has expanded his Hotel Industry far into Europe, like the Hotel Imperial in Vienna and Al Habtoor Palace Budapest.",
                      ),

                      BioCard(
                        image: "assets/img/bio3.webp",
                        name: "Khulood Atiq",
                        role: "Culinary",
                        avatar: "assets/img/bio3.webp",
                        descripton: "Khulood Atiq is a culinary figure dedicated to promoting and preserving traditional Emirati cuisine. She showcases dishes like harees and machboos at international events and has worked as a specialist in Emirati and Arab cuisine within Abu Dhabi’s tourism sector, helping introduce traditional food to global hotels and restaurants. She is recognized for maintaining authenticity while making traditional cuisine appealing to younger generations.",
                      ),

                      BioCard(
                        image: "assets/img/bio4.webp",
                        name: "Ashwaq Abdulla",
                        role: "Visual Artist",
                        avatar: "assets/img/bio4.webp",
                        descripton: " Ashwaq Abdulla is a visual artist from Abu Dhabi, United Arab Emirates. She focuses on Emirati culture and women’s roles. She studied design and graphic arts at the Higher Colleges of Technology. She uses watercolor, acrylic, and murals in her work. Her style mixes tradition with modern ideas. She designed the trophy for the Mubadala Silicon Valley Classic. She also created a digital exhibition about Emirati women and history.",
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: SizedBox(
                      height: 240,
                      width: 190,
                      child: const BioCard(
                        image: "assets/img/bio5.webp",
                        name: "Majid Al-Futtaim",
                        role: "Accounting",
                        avatar: "assets/img/bio5.webp",
                        descripton: "The Pioneer of Modern Lifestyle Until his passing in 2021, Majid Al Futtaim was perhaps the most private yet influential figure in the region. He didn't just build malls, he invented the concept of retail-tainment in the Middle East. Unlike Alabbar, Al Futtaim stayed out of the spotlight, but his presence is felt in every cinema (VOX), every supermarket, and every luxury mall across the continent.",
                      ),
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

class BioCard extends StatelessWidget {
  final String image;
  final String name;
  final String role;
  final String descripton;
  final String avatar;

  const BioCard({
    super.key,
    required this.image,
    required this.name,
    required this.role,
    required this.descripton,
    required this.avatar,
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
                    description: descripton,
                    role: role,
                    avatar: avatar,
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