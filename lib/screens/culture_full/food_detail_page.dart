import 'dart:ui';
import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String taste;
  final String texture;
  final String nutrition;
  final String calories;
  final String ingredients;
  final String howToMake;
  final String category;
  final List<Map<String, String>> nutritions;

  const FoodDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.taste,
    required this.texture,
    required this.nutrition,
    required this.calories,
    required this.ingredients,
    required this.howToMake,
    required this.category,
    required this.nutritions,
  });

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E7EB),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              clipBehavior: Clip.none,
              children: [
            
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/header_texture.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      child: Image.asset(
                        image,
                        width: 412,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
            
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            
                Positioned(
                  bottom: -40,
                  left: 20,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Color(0xFF1D1D1D).withValues(alpha: 0.35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Uni Emirates Arab $category",
                              style: const TextStyle(fontSize: 12, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const SizedBox(height: 30),
            
                  Text(
                    description,
                    style: const TextStyle(
                        fontSize: 13,
                        height: 1.6,
                        color: Colors.black87),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Expanded(child: _infoCard("Taste", taste)),
                      const SizedBox(width: 12),
                      Expanded(child: _infoCard("Texture", texture)),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "NUTRITION",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B2409)),
                  ),

                  const SizedBox(height: 15),

                  buildNutritionList(
                    nutritions.map((item) =>
                      _nutritionCard(item["title"]!, item["text"]!)
                    ).toList(),
                  ),

                  const SizedBox(height: 30),

                  _caloriesCard(calories),

                  const SizedBox(height: 30),

                  Text(
                    "MAKE ${title.toUpperCase()} $category",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B2409)),
                  ),

                  const SizedBox(height: 15),

                  _stepCard("INGREDIENTS: 180/PORTION", ingredients),

                  const SizedBox(height: 20),

                  _stepCard("HOW TO MAKE:", howToMake),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _infoCard(String title, String text) {
  return Container(
    height: 170,
    width: 168,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 3,
          offset: const Offset(0, 6),
        ),
      ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            image: DecorationImage(
              image: AssetImage("assets/img/header_texture.webp"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        ),

        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _nutritionCard(String title, String text) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF492005),
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          text,
          style: const TextStyle(fontSize: 10, height: 1.4),
        ),
      ],
    ),
  );
}

  Widget buildNutritionList(List<Widget> items) {
  List<Widget> rows = [];

  for (int i = 0; i < items.length; i += 2) {
    if (i == items.length - 1) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: items[i],
          ),
        ],
      ));
    } 
    else {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 150, child: items[i]),
          const SizedBox(width: 20),
          SizedBox(width: 150, child: items[i + 1]),
        ],
      ));
    }

    rows.add(const SizedBox(height: 12)); 
  }

  return Column(children: rows);
}

  Widget _stepCard(String label, String content) {
  return Stack(
    clipBehavior: Clip.none,
    children: [

      Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 35, 16, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26, width: 1),
        ),
        child: Text(
          content,
          style: const TextStyle(fontSize: 12, height: 1.6),
        ),
      ),

      Positioned(
        top: -8,
        left: 15,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/img/header_texture.webp"),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      Positioned(
        top: -12,
        left: -8,
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFFD9D9D9),
            shape: BoxShape.circle,
          ),
        ),
      ),
    ],
  );
}

 Widget _caloriesCard(String caloriesText) {
  return Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F1F1), 
      borderRadius: BorderRadius.circular(22),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "CALORIES",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B2409),
          ),
        ),

        const SizedBox(height: 12),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xFFF5F5F5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                ),
                child: const Text(
                  "Calories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF4B2409),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  caloriesText,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.6,
                  ),
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

