import 'package:flutter/material.dart';

class DiaryDetailsScreen extends StatelessWidget {
  const DiaryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1), // Background color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Diary
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 40),
              child: Column(
                children: [
                  Text(
                    "PARIS, 2023",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Allura",
                      fontSize: 56,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

            // Date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                   height: 60, // Increased card height
                  child: Card(
                    color: const Color.fromRGBO(228, 255, 221, 1), // Light yellow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/calendar.png', // Replace with your adventure image
                        width: 40,
                      ),
                      title: const Text(
                        'May 27 ‘23 Friday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Adamina',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
            ),
            const SizedBox(height: 30),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SizedBox(
                height: 60, // Increased card height
                child: Card(
                  color: const Color.fromRGBO(255, 233, 224, 1), // Light yellow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: const Text(
                      'Eiffel Tower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Adamina',
                        fontSize: 26,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Diary Entry Section with Lines
                Stack(
                  children: [
                    // Draw lines
                    Column(
                      children: List.generate(
                        7, // Number of lines (based on the text rows)
                            (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Container(
                            height: 1,
                            color: Colors.black.withOpacity(0.3
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Diary Text
                    const Text(
                      "Dear diary, today I was on the Eiffel Tower. It was an amazing adventure. I was on the top of\n the tower with a lift. The view \nwas unforgettable. There are some\n pictures I took.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        height: 1.8, // Line height
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Images Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // First Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/eiffel_tower.jpg', // Replace with your image asset
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Second Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/view.jpg', // Replace with your image asset
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
        )
        ),
        );
  }
}

