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
    'assets/img/banner_1.png',
    'assets/img/banner_2.png',
    'assets/img/banner_3.png',
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
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFC5D1B5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 25,
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icon/logo.png',
                    height: 35,
                    errorBuilder: (context, _, _) => const Text(
                      "MIRAE",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClipPath(
                    clipper: PhotoFrameClipper(),
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
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
                                  cacheWidth: 1000,
                                ),
                              ),
                              const Positioned(
                                left: 25,
                                top: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Visit", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Serif', height: 1.0)),
                                    Text("United Arab", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Serif', height: 1.1)),
                                    Text("Emirates", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Serif', height: 1.1)),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text('Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _categoryItem('assets/icon/nature.svg', 'Nature', const Color(0xFF4CAF50), onTap: () => Navigator.pushNamed(context, '/nature')),
                  _categoryItem('assets/icon/culture.svg', 'Culture', const Color(0xFFE53935), onTap: () => Navigator.pushNamed(context, '/culture')),
                  _categoryItem('assets/icon/biography.svg', 'Biography', const Color(0xFFFB8C00), onTap: () => Navigator.pushNamed(context, '/biography')),
                  _categoryItem('assets/icon/global-values.svg', 'Global Values', const Color(0xFF00897B), onTap: () => Navigator.pushNamed(context, '/global_values')),
                ],
              ),
              const SizedBox(height: 35),
              const Text('WORLD MAP NAVIGATION', style: TextStyle(color: Color(0xFF8E8E8E), fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
              const SizedBox(height: 15),
              AspectRatio(
                aspectRatio: 1.5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 5))],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/img/map.png', fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 160),
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryItem(String iconPath, String label, Color color, {VoidCallback? onTap}) {
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
            child: SvgPicture.asset(iconPath, width: 24, height: 24, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w500)),
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