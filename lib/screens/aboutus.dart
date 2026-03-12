import 'package:flutter/material.dart';

class AboutusPage extends StatefulWidget {
  const AboutusPage({super.key});

  @override
  State<AboutusPage> createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutusPage> {

  String selectedMajor = "PPLG";

  final Map<String, List<Map<String, String>>> members = {

    "PPLG": [
      {
        "image": "assets/img/abs/fikri.webp",
        "name": "R. Wan Fikri Pricahyadi",
        "role": "Leader, Mobile Dev",
      },
      {
        "image": "assets/img/abs/leon.webp",
        "name": "Leon Manuel Nadeak",
        "role": "Web Dev",
      },
      {
        "image": "assets/img/abs/tamam.webp",
        "name": "Ghani Bahrut Tamam",
        "role": "UI/UX",
      },
      {
        "image": "assets/img/abs/derren.webp",
        "name": "Darren Raisya Iqbal",
        "role": "UI/UX",
      },
      {
        "image": "assets/img/abs/patur.webp",
        "name": "Patur Marcelio Limbong",
        "role": "Mobile Dev",
      },
      {
        "image": "assets/img/abs/fransisico.webp",
        "name": "Fransisco Valentino",
        "role": "Mobile Dev",
      },
      {
        "image": "assets/img/abs/josua.webp",
        "name": "Riski Josuwa",
        "role": "Member",
      },
    ],
      

    "DKV": [
      {
        "image": "assets/img/member3.jpg",
        "name": "Rizky",
        "role": "Graphic Designer",
      },
      {
        "image": "assets/img/member4.jpg",
        "name": "Aldo",
        "role": "Illustrator",
      },
      {
        "image": "assets/img/member4.jpg",
        "name": "Aldo",
        "role": "Illustrator",
      },
      {
        "image": "assets/img/member4.jpg",
        "name": "Aldo",
        "role": "Illustrator",
      },
      {
        "image": "assets/img/member4.jpg",
        "name": "Aldo",
        "role": "Illustrator",
      },
      {
        "image": "assets/img/member4.jpg",
        "name": "Aldo",
        "role": "Illustrator",
      },
    ],

    "CULINARY": [
      {
        "image": "assets/img/member2.jpg",
        "name": "Chef Budi",
        "role": "Head Chef",
      },
      {
        "image": "assets/img/member3.jpg",
        "name": "Rama",
        "role": "Pastry Chef",
      },
    ],

    "HOSPITALITY": [
      {
        "image": "assets/img/member4.jpg",
        "name": "Nadia",
        "role": "Front Office",
      },
      {
        "image": "assets/img/member2.jpg",
        "name": "Andre",
        "role": "Guest Service",
      },
    ],

    "BUSINESS": [
      {
        "image": "assets/img/member3.jpg",
        "name": "Kevin",
        "role": "Marketing",
      },
      {
        "image": "assets/img/member4.jpg",
        "name": "Farhan",
        "role": "Business Analyst",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {

    final currentMembers = members[selectedMajor] ?? [];

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

                    const SizedBox(height: 20),

                    GridView.builder(
                      itemCount: currentMembers.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {

                        final member = currentMembers[index];

                        return _memberCard(
                          member["image"]!,
                          member["name"]!,
                          member["role"]!,
                        );
                      },
                    ),

                    const SizedBox(height: 40,)

                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

Widget _chip(String text) {

  bool isSelected = selectedMajor == text;

  return GestureDetector(
    onTap: () {
      setState(() {
        selectedMajor = text;
      });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF9CAB84)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected
              ? const Color(0xFF9CAB84)
              : Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          

          const SizedBox(width: 6),

          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _memberCard(String image, String name, String role) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        Text(
          role,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

      ],
    );
  }
}