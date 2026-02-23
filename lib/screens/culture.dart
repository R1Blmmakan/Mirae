import 'package:flutter/material.dart';

class CulturePage extends StatelessWidget {
  const CulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Culture'),
      ),
      body: const Center(
        child: Text('Test Culture Page'),
      ),
    );
  }
}