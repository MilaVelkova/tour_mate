import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isInitialized = false;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras.last, ResolutionPreset.high);
    await _controller.initialize();
    setState(() => _isInitialized = true);
  }

  Future<void> _captureImage() async {
    if (!_controller.value.isInitialized) return;
    try {
      final image = await _controller.takePicture();
      setState(() => _capturedImage = image);
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: _isInitialized
                ? CameraPreview(_controller)
                : const Center(child: CircularProgressIndicator()),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Motion", style: TextStyle(color: Colors.white54)),
                    Text("Portrait", style: TextStyle(color: Colors.white54)),
                    Text("Camera", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text("Video", style: TextStyle(color: Colors.white54)),
                    Text("Cinematic", style: TextStyle(color: Colors.white54)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _capturedImage != null
                        ? ClipOval(
                      child: Image.file(
                        File(_capturedImage!.path),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    )
                        : const SizedBox(width: 50, height: 50),
                    GestureDetector(
                      onTap: _captureImage,
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                      ),
                    ),
                    Icon(Icons.cameraswitch, color: Colors.white, size: 40),
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
