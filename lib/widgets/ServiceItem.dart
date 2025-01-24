import 'package:flutter/material.dart';

import '../screens/MapScreen.dart';
 // Import the MapScreen for navigation

class ServiceItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String label; // Label for the right side (e.g., "Restaurant" or "Park")
  final Color labelColor; // Background color for the label
  final IconData labelIcon; // Icon for the label

  const ServiceItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.label,
    required this.labelColor,
    required this.labelIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        children: [
          // Left-side image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 18),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Color.fromRGBO(48, 90, 132, 1)),
                ),
              ],
            ),
          ),
          // Right-side label with icon and map button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: labelColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      labelIcon,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            tooltip: 'View on Map',
          ),
        ],
      ),
    );
  }
}
