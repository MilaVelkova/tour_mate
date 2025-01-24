import 'package:flutter/material.dart';
import 'package:tour_mate/widgets/BuildModelItem.dart';// Import the new widget

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Camera Preview
          Expanded(
            child: Stack(
              children: [
                // Placeholder for camera preview
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/sea.jpg'), // Example background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Focus frame in the center
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.8),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Camera Controls
          Container(
            color: const Color.fromRGBO(7, 12, 27, 1),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                // Mode Selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    BuildModelItem(label: "Document", isSelected: false),
                    BuildModelItem(label: "Video", isSelected: false),
                    BuildModelItem(label: "Photo", isSelected: true),
                    BuildModelItem(label: "Portrait", isSelected: false),
                    BuildModelItem(label: "Night", isSelected: false),
                  ],
                ),
                const SizedBox(height: 16),
                // Capture and Controls Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Thumbnail
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: const AssetImage('assets/camera.png'), // Thumbnail Image
                    ),
                    // Capture Button
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    // Switch Camera Button
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.cameraswitch,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
