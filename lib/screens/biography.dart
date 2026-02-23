import 'package:flutter/material.dart';


class BiographyPage extends StatelessWidget {
  const BiographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biography'),
      ),
      body: const Center(
        child: Text('Test Biography Page'),
      ),
    );
  }
}