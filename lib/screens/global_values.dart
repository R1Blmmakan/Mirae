import 'package:flutter/material.dart';

class GlobalValues extends StatefulWidget {
  const GlobalValues({super.key});

  @override
  State<GlobalValues> createState() => _GlobalValuesState();
}

class _GlobalValuesState extends State<GlobalValues> {

  String headerImage = "assets/img/quran.webp";

  String sectionTitle = "Language";
  String sectionText =
      "The official language of the UAE is Arabic. However, English is widely used in daily communication, business, education, and tourism. Other languages such as Hindi, Urdu, and Tagalog are also commonly spoken because many expatriates live and work in the UAE. If you want, I can make a shorter version for pre";

  void changeContent(String image, String title, String text) {
    setState(() {
      headerImage = image;
      sectionTitle = title;
      sectionText = text;
    });
  }

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
          "Global Values",
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HEADER IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    headerImage,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              color: const Color(0xFFB59A5D),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              child: const Text(
                "GLOBAL VALUES",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                sectionTitle,
                style: const TextStyle(
                  color: Color(0xFF947D49),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                sectionText,
                textAlign: TextAlign.justify,
                style: const TextStyle(height: 1.5),
              ),
            ),

            const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [

                            Row(
                              children: [
                                Expanded(
                                  child: _ImageCard(
                                    imagePath: "assets/img/quran.webp",
                                    onTap: () {
                                      changeContent(
                                        "assets/img/quran.webp",
                                        "Language",
                                        "The official language of the UAE is Arabic. However, English is widely used in daily communication, business, education, and tourism. Other languages such as Hindi, Urdu, and Tagalog are also commonly spoken because many expatriates live and work in the UAE. If you want, I can make a shorter version for pre",
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _ImageCard(
                                    imagePath: "assets/img/government.webp",
                                    onTap: () {
                                      changeContent(
                                        "assets/img/government.webp",
                                        "Government",
                                        "The United Arab Emirates has a federal monarchy system. It consists of seven emirates. The country is led by a President, usually the ruler of Abu Dhabi, and a Prime Minister, usually the ruler of Dubai. Each emirate has its own ruler but works together under the federal government.",
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                Expanded(
                                  child: _ImageCard(
                                    imagePath: "assets/img/dirham.webp",
                                    onTap: () {
                                      changeContent(
                                        "assets/img/dirham.webp",
                                        "Currency",
                                        "The official currency of the UAE is the United Arab Emirates Dirham (AED).\n• 1 Dirham = 100 fils\n• Currency symbol: AED or د.إ\n• Used throughout all emirates in the UAE",
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _ImageCard(
                                    imagePath: "assets/img/mosque.webp",
                                    onTap: () {
                                      changeContent(
                                        "assets/img/mosque.webp",
                                        "Religion",
                                        "Religion in United Arab Emirates is diverse, but Islam is the official and main religion. Most Emirati citizens are Muslim. other religions such as Christianity, Hinduism, Buddhism, and Sikhism are also practiced. The UAE is known for its religious tolerance and multicultural society.",
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                Expanded(
                                  child: _ImageCard(
                                    imagePath: "assets/img/orangArab.webp",
                                    onTap: () {
                                      changeContent(
                                        "assets/img/orangArab.webp",
                                        "Livelihoods",
                                        "• Oil and gas industry\n• Construction and real estate\n• Tourism and hospitality\n• Trade and international business\n• Transportation and aviation\n• Banking and finance\n• Fishing and pearl diving (traditional)",
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _ImageCard(
                                    imagePath: "assets/img/on.webp",
                                    onTap: () {
                                      changeContent(
                                        "assets/img/on.webp",
                                        "Race & Ethnicity",
                                        "Races / Ethnic Groups\n• Arab (Emirati – native population)\n• South Asians (Indian, Pakistani, Bangladeshi)\n\nMajor Emirati Tribes\n• Bani Yas\n• Al Nahyan\n• Al Maktoum\n• Al Qasimi",
                                      );
                                    },
                                  ),
                                ),
                              ],
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


class _ImageCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const _ImageCard({required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath,
          height: 110,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}