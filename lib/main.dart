import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mirae/screens/dashboard.dart';
import 'package:mirae/screens/destinasi.dart';
import 'package:mirae/screens/nature.dart';
import 'package:mirae/screens/culture.dart';
import 'package:mirae/screens/biography.dart';
import 'package:mirae/screens/global_values.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
        '/nature': (context) => const NaturePage(),
        '/culture': (context) => const CulturePage(),
        '/biography': (context) => const BiographyPage(),
        '/global_values': (context) => const GlobalValues(),
      },
    );
  }
}
