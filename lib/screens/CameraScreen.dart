import 'package:flutter/material.dart';

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
                      image: AssetImage(
                          'assets/sea.jpg'), // Example background image
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
            color: Color.fromRGBO(7, 12, 27, 1),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                // Mode Selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildModeItem("Document", isSelected: false),
                    _buildModeItem("Video", isSelected: false),
                    _buildModeItem("Photo", isSelected: true),
                    _buildModeItem("Portrait", isSelected: false),
                    _buildModeItem("Night", isSelected: false),
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
                      backgroundImage: const AssetImage(
                        'assets/camera.png'
                      ), // Thumbnail Image
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

  Widget _buildModeItem(String label, {required bool isSelected}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.yellow : Colors.white,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isSelected)
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
          ),
      ],
    );
  }
}
