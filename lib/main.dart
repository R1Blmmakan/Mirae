import 'package:flutter/material.dart';
import 'package:mirae/screens/dashboard.dart';
import 'package:mirae/screens/destinasi.dart';
import 'package:mirae/screens/nature.dart';
import 'package:mirae/screens/culture.dart';
import 'package:mirae/screens/aboutus.dart';
import 'package:mirae/screens/biography.dart';
import 'package:mirae/screens/global_values.dart';
import 'package:mirae/screens/glvalues_child/government.dart';
import 'package:mirae/screens/glvalues_child/currency.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        '/government': (context) => const GovernmentPage(),
        '/currency': (context) => const CurrencyPage(),
      },
    );
  }
}
