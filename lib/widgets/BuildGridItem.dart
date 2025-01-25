import 'package:flutter/material.dart';

class BuildGridItem extends StatelessWidget {
  const BuildGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.4,
      ),
      itemCount: _imageData.length,
      itemBuilder: (context, index) {
        return _buildGridItem(_imageData[index]);
      },
    );
  }

  Widget _buildGridItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

const List<String> _imageData = [
  'assets/card1.png',
  'assets/card2.png',
  'assets/card3.png',
  'assets/card4.png',
  'assets/card5.png',
  'assets/card6.png',
  'assets/card7.png',
  'assets/card8.png',
  'assets/card9.png',
  'assets/card10.png',
];
