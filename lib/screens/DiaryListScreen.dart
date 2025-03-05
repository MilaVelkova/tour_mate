import 'package:flutter/material.dart';
import '../widgets/DiaryCard.dart';

class DiaryListScreen extends StatefulWidget {
  @override
  _DiaryListScreenState createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  List<Map<String, dynamic>> diaries = [
    {
      'title': 'PARIS, 2023',
      'imagePath': 'assets/paris.jpg',
      'backgroundColor': const Color.fromRGBO(228, 255, 221, 1),
    },
    {
      'title': 'ISTANBUL, 2024',
      'imagePath': 'assets/istanbul.jpg',
      'backgroundColor': const Color.fromRGBO(171, 234, 211, 1),
    },
    {
      'title': 'LONDON, 2023',
      'imagePath': 'assets/london.jpg',
      'backgroundColor': const Color.fromRGBO(177, 222, 254, 1),
    },
    {
      'title': 'VIENNA, 2022',
      'imagePath': 'assets/vienna.jpg',
      'backgroundColor': const Color.fromRGBO(255, 126, 126, 1),
    },
  ];

  // Add a new diary to the list
  void _addDiary(Map<String, dynamic> diaryData) {
    setState(() {
      diaries.add({
        "title": diaryData["title"] ?? "Untitled",
        "backgroundColor": const Color.fromRGBO(255, 153, 204, 1), // Light yellow
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
        elevation: 0,
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
            // Button to Add New Diary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: InkWell(
                onTap: () async {
                  final newDiary = await Navigator.pushNamed(context, '/newDiary');
                  if (newDiary != null && newDiary is Map<String, dynamic>) {
                    _addDiary(newDiary);
                  }
                },
                child: SizedBox(
                  height: 80,
                  child: Card(
                    color: const Color.fromRGBO(255, 221, 221, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Write a new diary...',
                        style: const TextStyle(fontSize: 22, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
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
            ),
            const SizedBox(height: 40),

            // Recent Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Recent",
                style: TextStyle(
                  fontFamily: 'Adamina',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Diary List
            Expanded(
              child: ListView.builder(
                itemCount: diaries.length,
                itemBuilder: (context, index) {
                  return DiaryCard(
                    title: diaries[index]["title"] ?? "Untitled",
                    imagePath: diaries[index].containsKey("imagePath")
                        ? diaries[index]["imagePath"]
                        : null,
                    backgroundColor: diaries[index]["backgroundColor"] ?? Colors.white,
                    onTap: () {
                      Navigator.pushNamed(context, '/diaryDetails');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
