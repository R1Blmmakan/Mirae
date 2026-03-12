import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirae/screens/dashboard.dart';
import 'package:mirae/screens/destinasi/destinasi.dart';
import 'package:mirae/screens/nature.dart';
import 'package:mirae/screens/culture_full/culture.dart';
import 'package:mirae/screens/aboutus.dart';
import 'package:mirae/screens/biography/biography.dart';
import 'package:mirae/screens/global_values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(417, 912),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Mirae App',
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          routes: {
            '/home': (context) => const Dashboard(),
            '/jelajahi': (context) => const DestinasiPage(),
            '/aboutus': (context) => const AboutusPage(),
            '/nature': (context) => const NaturePage(),
            '/culture': (context) => const CulturePage(),
            '/biography': (context) => const BiographyPage(),
            '/global_values': (context) => const GlobalValues(),
          },
        );
      },
    );
  }
}