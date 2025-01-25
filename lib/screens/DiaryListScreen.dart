import 'package:flutter/material.dart';

import '../widgets/DiaryCard.dart';


class DiaryListScreen extends StatelessWidget {
  const DiaryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1), // Background color
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 191, 171, 1), // Match background color
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Back arrow
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Diary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/newDiary');
                },
                child: SizedBox(
                  height: 110, // Increased card height
                  child: Card(
                    color: const Color.fromRGBO(255, 221, 221, 1), // Light yellow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/diary1.png', // Replace with your diary image
                            width: 110, // Match card height
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Write a new diary...',
                              style: const TextStyle(fontSize: 22, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Search Bar
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(Icons.search, color: Colors.black),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Recents
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Recents",
                style: TextStyle(
                  fontFamily: 'Adamina',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Diary Cards
            DiaryCard(
              title: 'PARIS, 2023',
              imagePath: 'assets/paris.jpg',
              backgroundColor: const Color.fromRGBO(228, 255, 221, 1),
              onTap: () {
                Navigator.pushNamed(context, '/diaryDetails');
              },
            ),
            const SizedBox(height: 50),
            DiaryCard(
              title: 'ISTANBUL, 2024',
              imagePath: 'assets/istanbul.jpg',
              backgroundColor: const Color.fromRGBO(171, 234, 211, 1),
              onTap: () {
              },
            ),
            const SizedBox(height: 50),
            DiaryCard(
              title: 'LONDON, 2023',
              imagePath: 'assets/london.jpg',
              backgroundColor: const Color.fromRGBO(177, 222, 254, 1),
              onTap: () {
              },
            ),
            const SizedBox(height: 50),
            DiaryCard(
              title: 'VIENNA, 2022',
              imagePath: 'assets/vienna.jpg',
              backgroundColor: const Color.fromRGBO(255, 126, 126, 1),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
