import 'package:flutter/material.dart';

class SKillWidget extends StatelessWidget {
  final String label;

  const SKillWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
      backgroundColor: Color.fromRGBO(228, 255, 221, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}