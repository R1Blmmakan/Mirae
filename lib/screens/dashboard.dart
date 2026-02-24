import 'package:flutter/material.dart';
import 'destinasi.dart';
import 'package:mirae/anim_logic/home_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 50;
    double itemWidth = screenWidth / 3;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: IndexedStack(
              key: ValueKey<int>(_selectedIndex),
              index: _selectedIndex,
              children: [
                HomeView(onTabChange: _onTabChange),
                const DestinasiPage(),
                const Center(child: Text("About Us Page")),
              ],
            ),
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
                _navItem(1, Icons.location_on_outlined, "Tourism", itemWidth),
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
                  BoxShadow(color: const Color(0xFFFF0000).withValues(alpha: 0.35), blurRadius: 12, offset: const Offset(0, 6)),
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
      onTap: () => _onTabChange(index),
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
            Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600)),
          ],
        ),
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
    path.arcToPoint(Offset(centerTarget + 34, 18), radius: const Radius.circular(37), clockwise: false);
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