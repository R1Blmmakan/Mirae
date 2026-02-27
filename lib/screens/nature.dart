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
            


                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "More Nature",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 15),
            
                  SizedBox(
                    height: 425,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        _buildSmallCard('assets/img/mosque.webp', 'Mosque'),
                        _buildSmallCard('assets/img/burj_khalifa.webp', 'Burj Khalifa'),
                        _buildSmallCard('assets/img/airport.webp', 'Airport'),
                        _buildSmallCard('assets/img/mosque.webp', 'Mosque'),
                        _buildSmallCard('assets/img/burj_khalifa.webp', 'Burj Khalifa'),
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

static Widget _buildSmallCard(String image, String title) {
  return Container(
    width: 300,
    margin: const EdgeInsets.only(right: 15),
    child: Stack(
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