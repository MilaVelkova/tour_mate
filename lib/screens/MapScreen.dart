import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Map View Placeholder',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
