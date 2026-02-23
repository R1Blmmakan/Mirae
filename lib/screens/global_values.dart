import 'package:flutter/material.dart';

class GlobalValues extends StatelessWidget {
  const GlobalValues({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Values'),
      ),
      body: const Center(
        child: Text('Test Global Values Page'),
      ),
    );
  }
}