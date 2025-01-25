import 'package:flutter/material.dart';

class DiaryDetailsScreen extends StatelessWidget {
  const DiaryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diary Title
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 40),
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
            const SizedBox(height: 20),

            // Date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                   height: 60,
                  child: Card(
                    color: const Color.fromRGBO(228, 255, 221, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/calendar.png',
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
                height: 60,
                child: Card(
                  color: const Color.fromRGBO(255, 233, 224, 1),
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

          // Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      children: List.generate(
                        7,
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
                      "Dear diary, today I was on the Eiffel Tower. "
                          "It was an amazing adventure. I was on the top of\n the tower with "
                          "a lift. The view \nwas unforgettable. There are some\n pictures I "
                          "took.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        height: 1.8,
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
                        'assets/eiffel_tower.jpg',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Second Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/view.jpg',
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

