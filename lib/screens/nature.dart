import 'package:flutter/foundation.dart';
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
                    child: _buildLargeCard('assets/img/nature.webp.webp'),
                  ),
            
                  const SizedBox(height: 35),
            
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
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        _buildSmallCard('assets/img/mosque.webp'),
                        _buildSmallCard('assets/img/burj_khalifa.webp'),
                        _buildSmallCard('assets/img/airport.webp'),
                        _buildSmallCard('assets/img/mosque.webp'),
                        _buildSmallCard('assets/img/burj_khalifa.webp'),
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

static Widget _buildSmallCard(String image) {
  return Container(
    width: 120,
    margin: const EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}

static Widget _buildLargeCard(String image) {
  return Container(
    width: double.infinity,
    height: 335,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}
}