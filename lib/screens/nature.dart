import 'package:flutter/material.dart';

class NaturePage extends StatelessWidget {
  const NaturePage({super.key});

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
                "Nature",
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  const SizedBox(height: 25),
            
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildLargeCard(context, 'assets/img/nature.webp.webp'),
                  ),
            
                  const SizedBox(height: 35),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildInfoCard(
                    title: "Total Area",
                    description:
                        "The United Arab Emirates covers an area of about 83,600 km² and consists of seven emirates, Abu Dhabi as the capital and the largest emirate at approximately 67,340 km².",
                    circleLeft: true,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildInfoCard(
                    title: "Geography",
                    description:
                        "The UAE is located in the Middle East or West Asia, between Oman and Saudi Arabia, and borders both the Persian Gulf and the Gulf of Oman.",
                    circleLeft: false,
                  ),
                ),

                const SizedBox(height: 30),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildInfoCard(
                    title: "Astronomy",
                    description:
                        "It lies between 22°50′–26° North latitude and 51°–56°25′ East longitude. Its landscapes include deserts, the Hajar Mountains, coastal areas, and mangroves.",
                    circleLeft: true,
                  ),
                ),
                
                const SizedBox(height: 30),
            


            Center(
              child: Container(
                width: 216,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFDC52), // Hijau (atas)
                      Color(0xFFFFDC52), // Hijau tetap
                      Color(0xFF263535), // Kuning (bawah)
                      Color(0xFFF4C430), // Kuning tetap
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0], 
                  ),
                ),
                child: const Text(
                  "BORDERLINE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            
                  const SizedBox(height: 15),
            
                  SizedBox(
                    height: 425,
                    child: PageView(
                      padEnds: false,
                      controller: PageController(viewportFraction: 0.8),
                      children: [
                        _buildSmallCard(context,'assets/img/mosque.webp', 'Mosque',
                        'The Gulf of Oman is a small sea that connects the Persian Gulf to the Arabian Sea (Indian Ocean).'),
                        _buildSmallCard(context,'assets/img/burj_khalifa.webp', 'Burj Khalifa',
                        'The Gulf of Oman is a small sea that connects the Persian Gulf to the Arabian Sea (Indian Ocean).'),
                        _buildSmallCard(context,'assets/img/airport.webp', 'Airport',
                        'The Gulf of Oman is a small sea that connects the Persian Gulf to the Arabian Sea (Indian Ocean).'),
                        _buildSmallCard(context,'assets/img/mosque.webp', 'Mosque',
                        'The Gulf of Oman is a small sea that connects the Persian Gulf to the Arabian Sea (Indian Ocean).'),
                        _buildSmallCard(context,'assets/img/burj_khalifa.webp', 'Burj Khalifa',
                        'The Gulf of Oman is a small sea that connects the Persian Gulf to the Arabian Sea (Indian Ocean).'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

static Widget _buildSmallCard(
  BuildContext context,
  String image,
  String title,
  String description,
) {
  return SizedBox(
    width: 300,
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailImagePage(
              image: image,
              title: title,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                image,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 12,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


static Widget _buildLargeCard(BuildContext context, String image) {
  return Stack(
    children: [
      Container(
    width: double.infinity,
    height: 335,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
  ),

  Positioned(
    top: 20,
    left: 20,
    child: GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_back, 
          color: Colors.black,
          size: 20,
          ),
      ),
      ),
    ),
    ],
  );

}

      static Widget _buildInfoCard({
        required String title,
        required String description,
        bool circleLeft = true,
      }) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.fromLTRB(20, 25, 25, 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.2),
              ),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

      /// Label Kuning
      Positioned(
        top: -5,
        left: circleLeft ? 25 : null,
        right: circleLeft ? null : 25,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC107),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),

      /// Bulatan Hitam
      Positioned(
        top: -10,
        left: circleLeft ? 0 : null,
        right: circleLeft ? null : 0,
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ],
  );
}
}


class DetailImagePage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const DetailImagePage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// Background Image
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          /// Gradient Atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          /// Back Button
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),

          /// Title Atas
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// Bottom Glass Card
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.35),
                    Colors.black.withOpacity(0.35),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Text(
                    "Gulf Of Oman",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}