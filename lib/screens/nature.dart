import 'package:flutter/material.dart';

class NaturePage extends StatelessWidget {
  const NaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Nature'),
      ),
      body: const Center(
        child: Text('Nature'),
      ),
    );
  }
}