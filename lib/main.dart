import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:mirae/screens/dashboard.dart';
import 'package:mirae/screens/destinasi.dart';
import 'package:mirae/screens/nature.dart';

void main() async {
  // 1. Core initialization
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Lock orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // 3. Launch the single source of truth
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirae App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfessionalSplash(),
        '/home': (context) => const Dashboard(),
        '/jelajahi': (context) => const DestinasiPage(),
        '/nature': (context) => const NaturePage(),
      },
    );
  }
}

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

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // THE REDIRECT LOGIC: This listens to the controller we defined above
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToHome();
      }
    });

    _logoRise = Tween<double>(begin: 150.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    _holeScale = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInBack),
      ),
    );

    _loadLogo('assets/icon/icon.png');
  }

  Future<void> _loadLogo(String assetPath) async {
    try {
      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List();
      final image = await decodeImageFromList(bytes);

      if (mounted) {
        setState(() => logoImage = image);
        _controller.forward();
      }
    } catch (e) {
      debugPrint(
        "STRATEGIC ERROR: Logo failed to load. Redirecting to prevent hang. $e",
      );
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (logoImage == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

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
    const holeRadius = 70.0;

    canvas.save();

    Path holePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: holeRadius));
    canvas.clipPath(holePath);

    double aspectRatio = image.width / image.height;
    double targetWidth = 100;
    double targetHeight = targetWidth / aspectRatio;

    Rect destRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + logoOffset),
      width: targetWidth,
      height: targetHeight,
    );

    Rect srcRect = Rect.fromLTWH(
      0,
      0,
      image.width.toDouble(),
      image.height.toDouble(),
    );

    canvas.drawImageRect(
      image,
      srcRect,
      destRect,
      Paint()..filterQuality = ui.FilterQuality.high,
    );

    canvas.restore();

    // Draw closing ring logic
    if (logoOffset < 5) {
      final paint = Paint()
        ..color = Colors.white.withValues(alpha: holeScale.clamp(0.0, 1.0))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3 * holeScale;
      canvas.drawCircle(center, holeRadius * holeScale, paint);
    }
  }

  @override
  bool shouldRepaint(covariant LogoRisePainter oldDelegate) {
    return oldDelegate.logoOffset != logoOffset ||
        oldDelegate.holeScale != holeScale;
  }
}
