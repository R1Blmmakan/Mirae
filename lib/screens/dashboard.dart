import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
import 'destinasi.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                const SizedBox(height: 20),
                ClipPath(
                  clipper: BannerClipper(),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: const Color(0xFFD9D9D9),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Jelajahi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // --- CATEGORIES ROW ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _categoryItem(
                      context,
                      'assets/icon/nature.svg',
                      'Nature',
                      Colors.green,
                      '/nature',
                    ),
                    _categoryItem(
                      context,
                      'assets/icon/culture.svg',
                      'Culture',
                      Colors.red,
                      '/culture',
                    ),
                    _categoryItem(
                      context,
                      'assets/icon/biography.svg',
                      'Biography',
                      Colors.yellow,
                      '/biography',
                    ),
                    _categoryItem(
                      context,
                      'assets/icon/global-values.svg',
                      'Global Values',
                      Colors.blue,
                      '/global-values',
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print("Pindah ke peta interaktif");
                      }
                    },
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E2E2E),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.orangeAccent.withValues(alpha: 0.5),
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(23),
                        child: Image.asset(
                          'assets/img/map.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, _, _) => const Center(
                            child: Icon(Icons.map, color: Colors.white24),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150),
              ],
            ),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: _buildFigmaNavbar(context, screenWidth),
          ),
        ],
      ),
    );
  }

  // --- NAVBAR BUILDER ---
  Widget _buildFigmaNavbar(BuildContext context, double width) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Home (Beranda)
          _navIcon(context, Icons.home, "Beranda", isActive: true),
          // Jelajahi
          _navIcon(context, Icons.location_on_outlined, "Jelajahi"),
          // About Us
          _navIcon(context, Icons.info_outline, "About Us"),
        ],
      ),
    );
  }

  // --- COMPONENT: CATEGORY ITEM ---
  Widget _categoryItem(
    BuildContext context,
    String icon,
    String label,
    Color color,
    String routeName,
  ) {
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print("Pindah ke $label");
        }
      Navigator.pushNamed(context, routeName);
      },
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: color.withValues(alpha: 0.2)),
              ),
              child: SvgPicture.asset(
                icon,
                width: 30,
                height: 30,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  // --- COMPONENT: NAV ICON ---
  Widget _navIcon(
    BuildContext context,
    IconData icon,
    String label, {
    bool isActive = false,
  }) {
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print("Navigasi ke $label");
        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => DestinasiPage()));
      },
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.redAccent : Colors.white70,
              size: 26,
            ),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.redAccent : Colors.white70,
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ... (Keep your BannerClipper class as is)

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(30, 0);
    path.lineTo(size.width - 30, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 30);
    path.lineTo(size.width, size.height - 60);

    path.quadraticBezierTo(
      size.width,
      size.height - 40,
      size.width - 20,
      size.height - 40,
    );
    path.quadraticBezierTo(
      size.width - 40,
      size.height - 40,
      size.width - 40,
      size.height - 20,
    );
    path.quadraticBezierTo(
      size.width - 40,
      size.height,
      size.width - 70,
      size.height,
    );

    path.lineTo(30, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 30);
    path.lineTo(0, 30);
    path.quadraticBezierTo(0, 0, 30, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
