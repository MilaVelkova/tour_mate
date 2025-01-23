import 'package:flutter/material.dart';
import 'package:tour_mate/widgets/BuildGridItem.dart';

class SelectPhotoScreen extends StatelessWidget {
  const SelectPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1), // Background color
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
        elevation: 0,
        title: const Text(
          'My Photos',
          style: TextStyle(color: Colors.black, fontFamily: 'Adamina'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Grid of Photos
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: BuildGridItem(), // Use the custom widget here
            ),
          ),
          // Buttons Row at the Bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        '/newDiary'
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(5, 41, 60, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Upload', style: TextStyle(fontSize: 20, )),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        '/camera'
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(5, 41, 60, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Take a Photo', style: TextStyle(fontSize: 20, )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
