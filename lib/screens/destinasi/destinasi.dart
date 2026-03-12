import 'package:flutter/material.dart';
import 'detail_destinasi_page.dart';
import 'detail_paket_page.dart';

class DestinasiPage extends StatefulWidget {
  const DestinasiPage({super.key});

  @override
  State<DestinasiPage> createState() => _DestinasiPageState();
}

class _DestinasiPageState extends State<DestinasiPage> {
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 350), () {
      if (mounted) {
        setState(() {
          _isReady = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              top: MediaQuery.of(context).padding.top + 15,
              left: 24,
            ),
            child: const Text(
              "Destinations",
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
                      "United Emirates Arab",
                      style: TextStyle(fontSize: 16),
                    ),

                    const Text(
                      "Destinations",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: !_isReady
                          ? const SizedBox(height: 320)
                          : SingleChildScrollView(
                              key: const ValueKey('heavy_content_1'),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  _buildLargeCard(
                                    'assets/img/airport.webp',
                                    'Zayed International Airport',
                                    'Abu Dhabi, UEA',
                                    'the premier, award-winning gateway to the UAE capital, featuring the state-of-the-art Terminal A. Located ~30km from the city center, it handles up to 45 million passengers annually, offering 120+ global destinations.',
                                  ),
                                  const SizedBox(width: 15),
                                  _buildLargeCard(
                                    'assets/img/mosque.webp',
                                    'Sheikh Zayed Grand Mosque',
                                    'Abu Dhabi, UEA',
                                    'The largest mosque in the UAE is the Sheikh Zayed Grand Mosque. It is located in Abu Dhabi and was built from 1994 to 2007.',
                                  ),
                                  const SizedBox(width: 15),
                                  _buildLargeCard(
                                    'assets/img/burj_khalifa.webp',
                                    'Burj Khalifa',
                                    'Dubai, UEA',
                                    'The skyscraper in Dubai that was built from 2004 to 2009 and officially opened in 2010 is the Burj Khalifa. It is the tallest building in the world.',
                                  ),
                                  const SizedBox(width: 15),
                                  _buildLargeCard(
                                    'assets/img/gurunnanak.webp',
                                    'Gurun Nanak Darbar Sikh Temple',
                                    'Abu Dhabi, UEA',
                                    'One of the first temples in the UAE, and even in the Middle East, is the Guru Nanak Darbar. It is located in Jebel Ali Village, Dubai and was built from 2008 to 2010.',
                                  ),
                                  const SizedBox(width: 15),
                                  _buildLargeCard(
                                    'assets/img/gur.webp',
                                    'Mahamevnawa Buddha Temple',
                                    'Dubai, UEA',
                                    'The only Buddhist temple in the UAE is the Mahamevnawa Buddhist Temple. It is located in Jumeirah, Dubai. The temple is open every day, but it is usually busiest on Fridays. Visitors can meditate, listen to Dhamma talks, and offer prayers to the Buddha.',
                                  ),
                                  const SizedBox(width: 15),
                                  _buildLargeCard(
                                    'assets/img/abra.webp',
                                    ' Abrahamic Family House',
                                    'Abu Dhabi, UEA',
                                    'One of the unique places in the UAE is the Abrahamic Family House. It is an interfaith complex in Abu Dhabi that shows the UAE’s commitment to tolerance.',
                                  ),
                                ],
                              ),
                            ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Popular Destination",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildSmallCard(
                          'assets/img/mosque.webp',
                          'Sheikh Zayed Grand Mosque',
                          'Abu Dhabi, UEA',
                          'The largest mosque in the UAE is the Sheikh Zayed Grand Mosque. It is located in Abu Dhabi and was built from 1994 to 2007.',
                        ),
                        _buildSmallCard(
                          'assets/img/burj_khalifa.webp',
                          'Burj Khalifa',
                          'Dubai, UEA',
                          'The only Buddhist temple in the UAE is the Mahamevnawa Buddhist Temple. It is located in Jumeirah, Dubai. The temple is open every day, but it is usually busiest on Fridays. Visitors can meditate, listen to Dhamma talks, and offer prayers to the Buddha.',
                        ),
                        _buildSmallCard(
                          'assets/img/abra.webp',
                          'Abrahamic Family House',
                          'Abu Dhabi, UEA',
                          'One of the unique places in the UAE is the Abrahamic Family House. It is an interfaith complex in Abu Dhabi that shows the UAE’s commitment to tolerance.',
                        ),
                        _buildSmallCard(
                          'assets/img/gurunnanak.webp',
                          'Gurunanak Darbar Sikh Temple',
                          'Dubai, UEA',
                          'One of the first temples in the UAE, and even in the Middle East, is the Guru Nanak Darbar. It is located in Jebel Ali Village, Dubai and was built from 2008 to 2010.',
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30),

                    const Text(
                      "Tourism Map",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 15),
                    
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/img/m.webp'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    const Text(
                      "Package Price",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 15),
                    
                    Row(
                      children: [
                        Expanded(
                          child: _buildPackageCard(
                            'assets/img/solo.webp',
                            'SOLO TRIP',
                            '1 PERSON',
                            'IDR 9.895.160',
                          
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _buildPackageCard(
                            'assets/img/family.webp',
                            'FAMILY TRIP',
                            '2 PERSON, 1 CHILD',
                            'IDR 18.770.320',
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    
                    const Text(
                      "Tourism Calendar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 15),
                    
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/img/c.webp'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

Widget _buildLargeCard(String imagePath, String title, String location, String description) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailDestinasiPage(
            image: imagePath,
            title: title,
            location: location,
            description: description,
          ),
        ),
      );
    },
    child: Container(
      width: 270,
      height: 405,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _buildSmallCard(String image, String title, String location, String description) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailDestinasiPage(
            image: image,
            title: title,
            location: location,
            description: description,
          ),
        ),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.5),
                  Colors.transparent
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),

          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      location,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


Widget _buildPackageCard(
  String image,
  String title,
  String subtitle,
  String price,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPaketPage(
            headerImage: image,
            title: title,
            subtitle: subtitle,
            price: price,
          ),
        ),
      );
    },
    child: Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: 0.6),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              price,
              style: const TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
