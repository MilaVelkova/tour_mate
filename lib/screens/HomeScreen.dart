import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(5, 191, 171, 1), // Background color
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          // Top Section with Name and Profile
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // User Name
              const Text(
                'John\nSmith',
                style: TextStyle(
                  fontFamily: "Adamina",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Profile Picture
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile.png'), // Replace with your profile image
              ),
            ],
          ),
        ),
        const SizedBox(height: 150),

        // Adventure Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context,
                  '/adventure'
              );
            },
          child: SizedBox(
            height: 110, // Increased card height
            child: Card(
              color: const Color.fromRGBO(254, 246, 218, 1), // Light yellow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Image.asset(
                  'assets/adventure.png', // Replace with your adventure image
                  width: 60,
                ),
                title: const Text(
                  'Adventure',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                subtitle: const Text(
                  'Find tours, adventures, activities',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        ),
        const SizedBox(height: 50),

        // Diary Card
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context,
                  '/diaryList'
              );
            },
                    child: SizedBox(
                    height: 110, // Increased card height
                    child: Card(
                    color:const Color.fromRGBO(255, 233, 224, 1), // Light pink
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
              ),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/diary.png', // Replace with your diary image
                            width: 60,
                          ),
                          title: const Text(
                            'Diary',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                                            color: Colors.black,
                                          ),
                              ),
                              subtitle: const Text(
                                'Write all your experience',
                                style: TextStyle(fontSize: 18, color: Colors.black,),
                              ),
                            ),
                    ),
                   ),
                  ),
                ),
                const SizedBox(height: 50),

                // Tour Guide
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          '/tourGuide'
                      );
                    },
                  child: SizedBox(
                    height: 110, // Increased card height
                    child: Card(
                      color: const Color.fromRGBO(192, 244, 239, 1), // Light blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/guide.png', // Replace with your photo & video image
                          width: 70,
                        ),
                        title: const Text(
                          'Tour Guide',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: const Text(
                          'Let Tour guides navigate for you',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
          ),
      ],
          )
        ),
    );
  }
}

