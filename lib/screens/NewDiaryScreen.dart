import 'package:flutter/material.dart';

class NewDiaryScreen extends StatelessWidget {
  const NewDiaryScreen({super.key});

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
                padding: const EdgeInsets.only(top: 40, left: 40),
                child: Column(
                  children: [
                    Text(
                      "Adventure Diary",
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
                        'Title',
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
                            10, // Number of lines (based on the text rows)
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
                          "Dear diary...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            height: 1.8, // Line height
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Save
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                '/diaryList'
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(5, 41, 60, 1), // Teal color for the button
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "SAVE",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),

                        //Upload
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                '/selectPhoto'
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(5, 41, 60, 1), // Teal color for the button
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Upload Photo",
                            style: TextStyle(fontSize: 20, color: Colors.white),
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

