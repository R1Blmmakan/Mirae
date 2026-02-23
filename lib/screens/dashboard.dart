import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'destinasi.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 50;
    double itemWidth = screenWidth / 3;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: [
              _buildHomeContent(context),
              const DestinasiPage(),
              const Center(child: Text("About Us Page")),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 15,
            left: 25,
            right: 25,
            child: _buildAnimatedNavbar(screenWidth, itemWidth),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 24,
        right: 24,
        bottom: 160,
      ),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/icon/logo.png',
            height: 35,
            errorBuilder: (context, _, _) => const Text(
              "MIRAE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
              image: AssetImage('assets/img/banner_uae.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text('Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _categoryItem(context, 'assets/icon/nature.svg', 'Nature', const Color(0xFF4CAF50), '/nature'),
            _categoryItem(context, 'assets/icon/culture.svg', 'Culture', const Color(0xFFE53935), '/culture'),
            _categoryItem(context, 'assets/icon/biography.svg', 'Biography', const Color(0xFFFB8C00), '/biography'),
            _categoryItem(context, 'assets/icon/global-values.svg', 'Global Values', const Color(0xFF00897B), '/global_values'),
          ],
        ),
        const SizedBox(height: 35),
        const Text(
          'WORLD MAP NAVIGATION',
          style: TextStyle(color: Color(0xFF8E8E8E), fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.5),
        ),
        const SizedBox(height: 15),
        AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('assets/img/map.png', fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedNavbar(double totalWidth, double itemWidth) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: _selectedIndex.toDouble()),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            builder: (context, value, child) {
              return CustomPaint(
                size: Size(totalWidth, 75),
                painter: NavbarPainter(index: value, itemWidth: itemWidth),
              );
            },
          ),
          Container(
            height: 75,
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _navItem(0, Icons.home_filled, "Home", itemWidth),
                _navItem(1, Icons.location_on_outlined, "Discover", itemWidth),
                _navItem(2, Icons.info_outline, "About Us", itemWidth),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            bottom: 45,
            left: (itemWidth * _selectedIndex) + (itemWidth / 2) - 28,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFFF0000),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF0000).withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(
                _selectedIndex == 0 ? Icons.home_filled : (_selectedIndex == 1 ? Icons.location_on_outlined : Icons.info_outline),
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label, double width) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isActive ? 0 : 1,
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryItem(BuildContext context, String iconPath, String label, Color color, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color, width: 1.5)),
            child: SvgPicture.asset(iconPath, width: 24, height: 24, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class NavbarPainter extends CustomPainter {
  final double index;
  final double itemWidth;
  NavbarPainter({required this.index, required this.itemWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFF1E1E1E)..style = PaintingStyle.fill;
    double centerTarget = (itemWidth * index) + (itemWidth / 2);
    Path path = Path();
    double r = 25.0;

    path.moveTo(r, 0);
    path.lineTo(centerTarget - 48, 0);
    path.quadraticBezierTo(centerTarget - 38, 0, centerTarget - 34, 18);
    path.arcToPoint(
      Offset(centerTarget + 34, 18),
      radius: const Radius.circular(37),
      clockwise: false,
    );
    path.quadraticBezierTo(centerTarget + 38, 0, centerTarget + 48, 0);
    path.lineTo(size.width - r, 0);
    path.quadraticBezierTo(size.width, 0, size.width, r);
    path.lineTo(size.width, size.height - r);
    path.quadraticBezierTo(size.width, size.height, size.width - r, size.height);
    path.lineTo(r, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - r);
    path.lineTo(0, r);
    path.quadraticBezierTo(0, 0, r, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NavbarPainter oldDelegate) => oldDelegate.index != index;
}