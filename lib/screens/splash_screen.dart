import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfessionalSplash extends StatefulWidget {
  const ProfessionalSplash({super.key});
  @override
  ProfessionalSplashState createState() => ProfessionalSplashState();
}

class ProfessionalSplashState extends State<ProfessionalSplash>
    with SingleTickerProviderStateMixin {
  ui.Image? logoImage;
  late AnimationController _controller;
  late Animation<double> _logoRise;
  late Animation<double> _holeScale;

  @override
  void initState() {
    super.initState();
    _loadLogo('assets/icon/icon.png'); // Ensure this is in your pubspec.yaml

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _logoRise = Tween<double>(begin: 150.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    _holeScale = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.easeInBack,
        ), // Ensure 'B' is lowercase
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to Home Screen here
      }
    });
  }

  // Strategic move: Load the image into the UI format before drawing
  Future<void> _loadLogo(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);
    setState(() => logoImage = image);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (logoImage == null) return const Scaffold(backgroundColor: Colors.black);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: const Size(300, 300),
              painter: LogoRisePainter(
                image: logoImage!,
                logoOffset: _logoRise.value,
                holeScale: _holeScale.value,
              ),
            );
          },
        ),
      ),
    );
  }
}

class LogoRisePainter extends CustomPainter {
  final ui.Image image;
  final double logoOffset;
  final double holeScale;

  LogoRisePainter({
    required this.image,
    required this.logoOffset,
    required this.holeScale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final holeRadius = 70.0; // The fixed size of the emergence point

    // 1. Create the clipping hole
    Path holePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: holeRadius));

    // Anything drawn after this is only visible inside the hole
    canvas.save();
    canvas.clipPath(holePath);

    // 2. Draw the Logo rising
    // We define a destination rect that moves up based on logoOffset
    Rect destRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + logoOffset),
      width: 100,
      height: 100,
    );

    Rect srcRect = Rect.fromLTWH(
      0,
      0,
      image.width.toDouble(),
      image.height.toDouble(),
    );

    canvas.drawImageRect(image, srcRect, destRect, Paint());
    canvas.restore();

    // 3. Draw the hole closing (visual ring)
    if (logoOffset < 10) {
      // Only start closing when logo is mostly up
      final paint = Paint()
        ..color = Colors.white
            .withValues(alpha: holeScale) // Modern replacement
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3 * holeScale;
      canvas.drawCircle(center, holeRadius * holeScale, paint);
    }
  }

  @override
  bool shouldRepaint(covariant LogoRisePainter oldDelegate) => true;
}
