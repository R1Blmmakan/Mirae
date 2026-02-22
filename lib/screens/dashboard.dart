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
    double screenWidth = MediaQuery.of(context).size.width - 40;
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
            bottom: 25,
            left: 20,
            right: 20,
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
        bottom: 150, 
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
            _categoryItem(context, 'assets/icon/global-values.svg', 'Global Values', const Color(0xFF00897B), '/global-values'),
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
      height: 95,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: _selectedIndex.toDouble()),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutBack, 
            builder: (context, value, child) {
              return CustomPaint(
                size: Size(totalWidth, 70),
                painter: NavbarPainter(index: value, itemWidth: itemWidth),
              );
            },
          ),
          SizedBox(
            height: 95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(0, Icons.home_filled, "Beranda"),
                _navItem(1, Icons.location_on_outlined, "Jelajahi"),
                _navItem(2, Icons.info_outline, "About Us"),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutBack,
            top: -10, 
            left: (itemWidth * _selectedIndex) + (itemWidth / 2) - 28,
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFFFF0000),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Color(0x66FF0000), blurRadius: 15, offset: Offset(0, 8)),
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

  Widget _navItem(int index, IconData icon, String label) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isActive ? 0 : 1,
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.transparent : Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
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
            decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15)),
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
    
    double topY = 25; 

    path.moveTo(35, topY); 
    path.lineTo(centerTarget - 60, topY);


    path.quadraticBezierTo(centerTarget - 45, topY, centerTarget - 35, topY + 15);
    path.arcToPoint(
      Offset(centerTarget + 35, topY + 15), 
      radius: const Radius.circular(40), 
      clockwise: false
    );
    path.quadraticBezierTo(centerTarget + 45, topY, centerTarget + 60, topY);

    path.lineTo(size.width - 35, topY);
    path.quadraticBezierTo(size.width, topY, size.width, topY + 35);
    path.lineTo(size.width, size.height + 20);
    path.lineTo(0, size.height + 20);
    path.lineTo(0, topY + 35);
    path.quadraticBezierTo(0, topY, 35, topY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NavbarPainter oldDelegate) => oldDelegate.index != index;
}