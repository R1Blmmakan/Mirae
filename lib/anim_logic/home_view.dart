import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _bannerImages = [
    'assets/img/banner_1.webp',
    'assets/img/banner_2.webp',
    'assets/img/banner_3.webp',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % _bannerImages.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF9CAB84),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),

          Positioned(
            top: 90,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),

          ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 120, 24, 0),
            children: [

              ClipPath(
                clipper: PhotoFrameClipper(),
                child: SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _bannerImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [

                          Positioned.fill(
                            child: Image.asset(
                              _bannerImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),

                          const Positioned(
                            left: 25,
                            top: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Visit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Serif',
                                  ),
                                ),
                                Text(
                                  "United Arab",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Serif',
                                  ),
                                ),
                                Text(
                                  "Emirates",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Serif',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _categoryItem(
                    'assets/icons/nature.svg',
                    'Nature',
                    const Color(0xFF4CAF50),
                    onTap: () => Navigator.pushNamed(context, '/nature'),
                  ),
                  _categoryItem(
                    'assets/icons/culture.svg',
                    'Culture',
                    const Color(0xFFE53935),
                    onTap: () => Navigator.pushNamed(context, '/culture'),
                  ),
                  _categoryItem(
                    'assets/icons/biography.svg',
                    'Biography',
                    const Color(0xFFFB8C00),
                    onTap: () => Navigator.pushNamed(context, '/biography'),
                  ),
                  _categoryItem(
                    'assets/icons/global-values.svg',
                    'Global Values',
                    const Color(0xFF00897B),
                    onTap: () => Navigator.pushNamed(context, '/global_values'),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              const Text(
                'WORLD MAP NAVIGATION',
                style: TextStyle(
                  color: Color(0xFF8E8E8E),
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 15),

              AspectRatio(
                aspectRatio: 1.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/img/map.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 160),
            ],
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 24,
            child: Image.asset(
              'assets/icons/logo.webp',
              height: 35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryItem(
    String iconPath,
    String label,
    Color color, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: color, width: 1.5),
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

class PhotoFrameClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;

    path.moveTo(30, 0);
    path.lineTo(w - 30, 0);
    path.quadraticBezierTo(w, 0, w, 30);
    path.lineTo(w, h - 60);
    path.quadraticBezierTo(w, h - 35, w - 30, h - 30);
    path.lineTo(w - 45, h - 25);
    path.quadraticBezierTo(w - 75, h - 20, w - 85, h);
    path.lineTo(30, h);
    path.quadraticBezierTo(0, h, 0, h - 30);
    path.lineTo(0, 30);
    path.quadraticBezierTo(0, 0, 30, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}