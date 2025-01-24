import 'package:flutter/material.dart';

class ContactInfoWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black87, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}