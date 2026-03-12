import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'clothing_detail_page.dart';
import 'food_detail_page.dart';

class CulturePage extends StatefulWidget {
  const CulturePage({super.key});

  @override
  State<CulturePage> createState() => _CulturePageState();
}

class _CulturePageState extends State<CulturePage> {

  String mainImage = "assets/img/bannerMakan.webp";
  String foodTitle = "Samboosa";
  String foodDesc = "A traditional Middle Eastern snack shaped like a triangle, similar to a samosa, and very popular in Gulf countries such as the United Arab Emirates, Saudi Arabia, and Kuwait. This dish is made from thin pastry sheets filled with various ingredients, such as seasoned minced meat, chicken, cheese, or vegetables. It is then folded into a triangle shape and deep-fried until crispy.";
  String foodTaste = "The taste of Samboosa is savory with light and delicious spices.";
  String foodTexture = "The texture of Samboosa is crispy on the outside with a soft filling inside.";
  String foodNutrition = "• Ground Beef 350g (Protein, Vit B12, Iron)\n• Wheat Flour 100g (Carbohydrate, Protein, Magnesium)\n• Potato 300g (Carbohydrate, Potassium, Vit C)\n• Onion (Antioxidant, Vit C)\n• Seasoning & Lemon (Minerals, Iron)";
  String foodCalories = "The total calories of Samboosa range from about 1,600–1,700 kcal. The ingredients include ground meat (about 890 kcal), potatoes (about 230 kcal), onions (about 70 kcal), wheat flour (about 364 kcal), lemon and thyme (about 10 kcal), plain yogurt (about 60 kcal), and spices (about 15 kcal). This food is rich in energy because it contains protein, carbohydrates, and fats that provide a savory and satisfying taste.";
  String foodIngredients = "DOUGH:\n• 360 g medium-protein wheat flour\n• 200 ml water\n• 3 g salt\n• ½ lemon\n\nFILLING:\n• 350 g ground beef\n• 2 potatoes\n• 1 onion\n• 3 cloves garlic\n• 2 g grated ginger\n• 11 g curry powder\n• 10 g cumin powder\n• 6 g coriander powder\n• 6 g salt\n• 6 g black pepper\n• Coriander leaves and green onions to taste\n\nLEMON DILL YOGHURT SAUCE:\n• 100 g yogurt\n• 3 ml lemon juice\n• 2 g thyme\n• Salt\n• Black pepper";
  String foodHowToMake = "DOUGH:\n• Mix the flour, salt, and lemon juice, then stir well. Add water little by little so the dough is not too wet. If it becomes too wet, add more flour while mixing.\n• Knead the dough until smooth, then let it rest for about 15–20 minutes. Make sure it is covered with a cloth or plastic.\n• Divide it into balls of 30–45 grams. Roll each dough ball thinly into a round shape.\n• Stack three layers of the rolled dough with a light brush of oil between them (do not use too much). Roll the three layers again until slightly thinner.\n• Toast the three layers of dough together over very low heat for only a few seconds, then flip immediately (do not wait until the pan is too hot). Place them on a tray.\n• Separate each layer carefully, shape them into perfect circles, then cut each circle into two.\n• From one half-circle, fold it into a triangle shape, fill it with sambosa filling until compact, then seal it. Use a mixture of flour and water as glue to close the open side.\n• Fry the sambosa over medium heat until golden brown, then remove and drain.\n\nFILLING:\n• Dice 2 potatoes into small cubes and boil them until slightly soft. Dice 2 onions and mince 3 cloves of garlic.\n• Sauté the onion and garlic with butter until fragrant, then add 2 tablespoons of water so the garlic does not burn. Add 350 g of ground meat and cook until it turns brown.\n• Keep stirring so the meat cooks evenly.\n• Add seasoning such as salt, black pepper, cumin powder, mushroom broth powder, curry powder, and a little sugar. Taste to adjust the flavor.\n• While stirring, add a little grated ginger gradually so the flavor is not too strong.\n\nLEMON DILL YOGHURT SAUCE:\n• Add 100 g yogurt.\n• Add 3 ml lemon juice.\n• Add 2 g thyme.\n• Add seasonings (salt, black pepper).\n• Stir until well combined and taste.";
  String foodCategory = "Food";
  List<Map<String, String>> foodNutritions = [
    {"title": "Ground Beef 350g", "text": "Protein 60 g, Vitamin B12, Iron, Fat 72 g"},
    {"title": "Wheat Flour 100g", "text": "Carbohydrate 76 g, Vitamin B, Magnesium, Protein 10 g, Fat 1 g."},
    {"title": "Potato 300g", "text": "Carbohydrates 51 g, Protein 6 g, Fiber, Potassium,"},
    {"title": "Yoghurty Plain 100g", "text": "Protein 5 g, Fat 3 g, Carbohydrates 4 g, Potassium, Probiotics."},
    {"title": "Onion", "text": "Protein 2g, Carbohydrates 14 g, Vit C, Fiber, Antioxidant."},
    {"title": "Seasoning & Lemon", "text": "Carbohydrates, Iron, Antioxidant."},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A),
      body: ListView(
          children: [

            const SizedBox(height: 20),

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

            const SizedBox(height: 25),

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

                  IgnorePointer(
                    ignoring: false,
                    child: Stack(
                    children: [

                      Column(
                        children: [
                          Image.asset(
                            "assets/img/orangNgumpul.webp",
                            height: 241,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            mainImage,
                            height: 241,
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
                                color: Colors.white.withValues(alpha: 0.25),
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

                      Positioned(
                        bottom: 60,
                        left: 25,
                        child: Text(
                          foodTitle,
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
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodDetailPage(
                                  title: foodTitle,
                                  image: mainImage,
                                  description: foodDesc,
                                  taste: foodTaste,
                                  texture: foodTexture,
                                  nutrition: foodNutrition,
                                  calories: foodCalories,
                                  ingredients: foodIngredients,
                                  howToMake: foodHowToMake,
                                  category: foodCategory,
                                  nutritions: foodNutritions,
                                ),
                              ),
                            );
                          },
                        
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
                      ),
                    ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        const SizedBox(width: 17),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mainImage = "assets/img/bannerMakan.webp";
                              foodTitle = "Samboosa";
                              foodDesc = "A traditional Middle Eastern snack shaped like a triangle, similar to a samosa, and very popular in Gulf countries such as the United Arab Emirates, Saudi Arabia, and Kuwait. This dish is made from thin pastry sheets filled with various ingredients, such as seasoned minced meat, chicken, cheese, or vegetables. It is then folded into a triangle shape and deep-fried until crispy.";
                              foodTaste = "The taste of Samboosa is savory with light and delicious spices.";
                              foodTexture = "The texture of Samboosa is crispy on the outside with a soft filling inside.";
                              foodNutritions = [
                                {"title": "Ground Beef 350g", "text": "Protein 60 g, Vitamin B12, Iron, Fat 72 g"},
                                {"title": "Wheat Flour 100g", "text": "Carbohydrate 76 g, Vitamin B, Magnesium, Protein 10 g, Fat 1 g."},
                                {"title": "Potato 300g", "text": "Carbohydrates 51 g, Protein 6 g, Fiber, Potassium,"},
                                {"title": "Yoghurty Plain 100g", "text": "Protein 5 g, Fat 3 g, Carbohydrates 4 g, Potassium, Probiotics."},
                                {"title": "Onion", "text": "Protein 2g, Carbohydrates 14 g, Vit C, Fiber, Antioxidant."},
                                {"title": "Seasoning & Lemon", "text": "Carbohydrates, Iron, Antioxidant."},
                              ];
                              foodCategory = "food";
                              foodCalories = "The total calories of Samboosa range from about 1,600–1,700 kcal. The ingredients include ground meat (about 890 kcal), potatoes (about 230 kcal), onions (about 70 kcal), wheat flour (about 364 kcal), lemon and thyme (about 10 kcal), plain yogurt (about 60 kcal), and spices (about 15 kcal). This food is rich in energy because it contains protein, carbohydrates, and fats that provide a savory and satisfying taste.";
                              foodIngredients = "DOUGH:\n• 360 g medium-protein wheat flour\n• 200 ml water\n• 3 g salt\n• ½ lemon\n\nFILLING:\n• 350 g ground beef\n• 2 potatoes\n• 1 onion\n• 3 cloves garlic\n• 2 g grated ginger\n• 11 g curry powder\n• 10 g cumin powder\n• 6 g coriander powder\n• 6 g salt\n• 6 g black pepper\n• Coriander leaves and green onions to taste\n\nLEMON DILL YOGHURT SAUCE:\n• 100 g yogurt\n• 3 ml lemon juice\n• 2 g thyme\n• Salt\n• Black pepper";
                              foodHowToMake = "DOUGH:\n• Mix the flour, salt, and lemon juice, then stir well. Add water little by little so the dough is not too wet. If it becomes too wet, add more flour while mixing.\n• Knead the dough until smooth, then let it rest for about 15–20 minutes. Make sure it is covered with a cloth or plastic.\n• Divide it into balls of 30–45 grams. Roll each dough ball thinly into a round shape.\n• Stack three layers of the rolled dough with a light brush of oil between them (do not use too much). Roll the three layers again until slightly thinner.\n• Toast the three layers of dough together over very low heat for only a few seconds, then flip immediately (do not wait until the pan is too hot). Place them on a tray.\n• Separate each layer carefully, shape them into perfect circles, then cut each circle into two.\n• From one half-circle, fold it into a triangle shape, fill it with sambosa filling until compact, then seal it. Use a mixture of flour and water as glue to close the open side.\n• Fry the sambosa over medium heat until golden brown, then remove and drain.\n\nFILLING:\n• Dice 2 potatoes into small cubes and boil them until slightly soft. Dice 2 onions and mince 3 cloves of garlic.\n• Sauté the onion and garlic with butter until fragrant, then add 2 tablespoons of water so the garlic does not burn. Add 350 g of ground meat and cook until it turns brown.\n• Keep stirring so the meat cooks evenly.\n• Add seasoning such as salt, black pepper, cumin powder, mushroom broth powder, curry powder, and a little sugar. Taste to adjust the flavor.\n• While stirring, add a little grated ginger gradually so the flavor is not too strong.\n\nLEMON DILL YOGHURT SAUCE:\n• Add 100 g yogurt.\n• Add 3 ml lemon juice.\n• Add 2 g thyme.\n• Add seasonings (salt, black pepper).\n• Stir until well combined and taste.";
                            });
                          },
                          child: _smallCard("assets/img/bannerMakan.webp"),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mainImage = "assets/img/bannerMakan2.webp";
                              foodTitle = "Chicken Machboss";
                              foodDesc = "A traditional chicken and rice dish originating from the Arabian Gulf region and considered one of the national foods of the United Arab Emirates. This dish developed from ancient spice trade routes that connected the Middle East with India and Persia, creating a unique blend of basmati rice, chicken, and aromatic spices such as cardamom.";
                              foodTaste = "The taste of Samboosa is savory with light and delicious spices.";
                              foodTexture = "The texture of Samboosa is crispy on the outside with a soft filling inside.";
                              foodNutritions = [
                              {"title": "Chicken 1 kg", "text": "Protein 120 g, Fat 100 g, Vit B12, Zinc, Iron"},
                              {"title": "Basmati Rice 1 kg", "text": "Protein 75 g, Carbohydrate 780 g, Low glycemic index, Vit B, Magnesium"},
                              {"title": "Butter Oil", "text": "Fat 55 g, Healthy Fats, Calorie Dense"},
                              {"title": "Tomato Sauce", "text": "Carbohydrate 35 g, lycopene"},
                              {"title": "Seasoning & Salt", "text": "Carbohydrates, Iron, Antioxidant"},
                              ];
                              foodCategory = "food";
                              foodCalories = "The total calories of Chicken Machboos range from about 1,400–1,500 kcal. The ingredients include chicken (about 1500 kcal), Bamasti rice (about 3600 kcal),  Butter, oil, Olive Oil(about 500 kcal), Tomato Sauce (about 200 kcal), And Seasoning & Salt (about 15 kcal). This dish is rich in energy because it contains protein from chicken, carbohydrates from rice, and healthy fats that create a savory flavor and aromatic taste.";
                              foodHowToMake = "• Add 20 g of oil to the pan.\n• Sauté the diced onion, then add 15 g chopped ginger, whole garlic cloves, and 2–3 green bird’s eye chilies. Sauté until lightly browned.\n• Then add:\n  - 1 cinnamon stick\n  - 4–5 cardamom pods\n  - 2 bay leaves\n  - 6 cloves\n  - 15 g black pepper\n• Add 1 kg chicken and sauté for 2 minutes. Then add 15 g salt, 15 g ground coriander, and ½ tbsp turmeric powder. Stir well until evenly mixed.\n• Add enough water, then add 30 g instant chicken stock, 1 dried lemon, 1 green chili, and 4 pieces of tomato. Cook for about 30 minutes until fragrant and fully cooked.\n\nTOPPING:\n• Sauté 15 g diced shallots until they turn brown and fragrant.\n• Prepare another pan, add 30 g of oil, then sauté 10 g of raisins.\n• Add the raisins to the sautéed shallots, stir briefly, then add 5 g of salt and 10 g of cardamom powder.\n\nCHICKEN SEASONING:\n• Prepare saffron water, then add 45 g ghee, 20 g garam masala, and Arabic spices. Mix well. Pour the mixture over the chicken and let it rest for 5 minutes.\n• Then fry or roast the chicken until fully cooked.\n\nSAUCE DAQOOS:\n• Blend the tomatoes until smooth. You can also finely chop them if you prefer a slightly chunky texture.\n• Sauté the aromatics: Heat olive oil in a small pot. Add the minced garlic and chili, sauté until fragrant and slightly browned.\n• Cook the tomato paste: Add the tomato paste to the sautéed garlic, stir well, and cook for about 1 minute to remove the raw taste.\n• Cook the sauce: Pour the blended tomatoes into the pot. Add water, cumin, salt, and pepper. Stir well.\n• Simmer: Let it come to a boil, then reduce the heat. Cook until the sauce thickens and the oil begins to separate (about 5–10 minutes).\n• Finishing: Add chopped coriander leaves and lemon juice or vinegar. Stir briefly and turn off the heat.\n• Serve: Serve warm or cold as a dipping sauce for Arabian rice.\n\nRICE:\n• Remove the chicken that was previously braised, then strain out the herbs. Prepare the Iranian rice that has been soaked for 30 minutes. Add the biryani rice to the pot, add salt to taste, then add 45 g butter. Stir the rice gently and cook for about 5 minutes or until cooked, then add 60 g saffron water.\n• During the 5 minutes of cooking, gently stir the biryani rice.";
                              foodIngredients = "• 20 g oil\n• 2 onions, chopped\n• 15 g chopped ginger\n• 10 cloves garlic\n• 3 green chilies\n• 30 g garam masala\n• 1 cinnamon stick\n• 5 cardamom pods\n• 2 bay leaves\n• 2 star anise\n• 6 cloves\n• 15 g black pepper\n• 1 kg whole chicken thighs\n• 15 g salt\n• 15 g ground coriander\n• 4 g turmeric powder\n• Water as needed\n• 30 g chicken stock\n• 1 dried lemon\n• 1 green chili\n• 2 tomatoes, cut into quarters\n• 1 kg basmati rice\n• 45 g butter\n• 60 g saffron water\n• 15 g melted butter\n• 15 g garam masala\n• 15 g Arabic spice powder / curry powder\n\nSAUCE DAQOOS:\n• 4 medium red tomatoes (300–400 g), diced\n• 5 cloves garlic, minced\n• 30 g tomato purée\n• 3 green chilies\n• 5 g coriander leaves\n• 27 g olive oil\n• 100 ml water\n• 2 g cumin powder\n• 7 g salt\n• 6 g black pepper\n• 15 g lemon juice";
                            });
                          },
                          child: _smallCard("assets/img/bannerMakan2.webp"),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mainImage = "assets/img/minums.webp";
                              foodTitle = "Laban";
                              foodDesc = "A traditional drink made from fermented milk that is popular in the Middle East. Generally, Laban with dates has a savory or slightly salty taste with a refreshing sour flavor from the yogurt. However, when dates are added, it gains a third flavor—sweetness—which makes the drink even more refreshing and energizing.";
                              foodCategory = "drink";
                              foodTaste = "It has a balanced sweet and sour taste, where the distinctive sweetness of the dates appears first, followed by a slightly tangy yogurt aftertaste.";
                              foodTexture = "It has a creamy and smooth texture from the yogurt, combined with a slightly fibrous and chewy texture when you bite into the dates.";
                              foodNutritions = [
                                {"title": "Kurma", "text": "High in fiber, potassium, vitamin B6, and magnesium."},
                                {"title": "Kurma Syrup", "text": "Fructose/Glucose and Iron."},
                                {"title": "Yoghurt", "text": "Protein, calcium, probiotics, and fat."},
                              ];
                              foodIngredients = "• Yoghurt : 70–80 ml\n• Water : 60–70 ml\n• Date Syrup : 40 ml\n• Date : Garnish (3)\n• Mint : Garnish\n• Ice : To Fill Up";
                              foodCalories = "The total calories of this drink range from 350–405 kcal, since dates are rich in calories. This drink can become an “energy bomb” because of its high calorie content, refreshing taste, and natural sugars that help restore the body’s balance after fasting.";
                              foodHowToMake = "• Add Water and Yoghurt together according to the recipe. Water could be still water, or cold water. Although, preferably cold water.\n• Mix them together until they fuse together.\n• Add the Date Syrup, and make sure to mix them together.\n• Add ice.\n• Chop up a few dates, and place it on top.\n• Add a mint leaf for garnish.\n• Don't forget, to serve!";
                            });
                          },
                          child: _smallCard("assets/img/minums.webp"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About  $foodTitle",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF947D49),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          foodDesc,
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
                          "assets/img/islam.webp",
                          "ISLAM",
                          const Color(0xFF9C5A24),
                          const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                    
                        religionCard(
                          "assets/img/kristen.webp",
                          "CHRISTIANITY",
                          const Color(0xFFD2B48C),
                          const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                    
                        const SizedBox(width: 50),
                    
                        religionCard(
                          "assets/img/buddha.webp",
                          "BUDDHISM",
                          const Color(0xFF9C5A24),
                          const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                    
                        religionCard(
                          "assets/img/hindu.webp",
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
                  Column(
                    children:[

                  _traditionCard(
                    "assets/img/Tradition1.webp",
                    "Al-Ayala",
                    "Al Ayala is a traditional dance performed by two rows of men holding thin sticks. It is usually performed during national celebrations, weddings, and important cultural events.",
                    313,
                  ),
                  _traditionCard(
                    "assets/img/Tradition2.webp",
                    "Falconry",
                    "Falconry is the traditional practice of hunting with falcons. It has been part of Emirati culture for centuries and symbolizes pride, honor, and heritage Majlis.",
                    313,
                  ),

                  _traditionCard(
                    "assets/img/Tradition3.webp",
                    "Camel Ricing",
                    "Camel racing is a popular traditional sport in the UAE. It reflects the desert lifestyle and cultural heritage of the Emirati people.",
                    313,
                  ),
                    ],
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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                    height: 370,
                    child: Row(
                      children: [
                  
                        Expanded(
                          child: _clothingCard(
                            context,
                            "assets/img/bajuLaki.webp",
                            "KANDURA",
                            "Kandura is the traditional long white robe worn by men in the UAE. It is designed to be comfortable in the hot desert climate. Emirati men usually wear the kandura with a head covering called the Ghutra, which is held in place with a black cord called the Agal.",
                          ),
                        ),
                  
                        const SizedBox(width: 20),
                  
                        Expanded(
                          child: _clothingCard(
                            context,
                            "assets/img/bajuPerempuan.webp",
                            "ABAYA",
                            "Abaya is a traditional black cloak worn by many women in the UAE. It is usually worn over regular clothing when going outside the home. The abaya represents modesty and is an important part of Emirati culture. Some abayas are simple, while others are decorated with embroidery or elegant designs.",
                          ),
                        ),
                  
                      ],
                    ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                ],
              ),
            ),
            
          ],
      ),
    );
  }

  static Widget _traditionCard(String image, String title, String desc, double height) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 1,
              offset: const Offset(0,5), 
            ),
          ],
        ),
      
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                height: 170,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    desc,
                    style: const TextStyle(fontSize: 12),
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

Widget _clothingCard(
  BuildContext context,
  String image,
  String text,
  String description,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClothingDetailPage(
            image: image,
            title: text,
            description: description,
          ),
        ),
      );
    },
    child: Container(
      height: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Stack(
          alignment: Alignment.center,
          children: [

            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              color: Colors.black.withValues(alpha: 0.25),
            ),

            Text(
              text.split("").join("\n"),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),

            const SizedBox(height: 40,)

          ],
        ),
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
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
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