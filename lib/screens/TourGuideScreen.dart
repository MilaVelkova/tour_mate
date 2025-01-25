import 'package:flutter/material.dart';

import '../widgets/TourGuideCard.dart';

class TourGuideScreen extends StatelessWidget {
  const TourGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: const Color.fromRGBO(5, 191, 171, 1),
        child: SafeArea(
          child: SizedBox.expand(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Tour Guide',
                      style: TextStyle(
                        fontSize: 56,
                        fontFamily: 'Allura',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Gap after the title
                  TourGuideCard(
                    name: "Peter Williams",
                    age: 26,
                    experience: "5 years experience, energetic and resourceful",
                    quote: "Collect memories, not things.",
                    avatar: "assets/peter.png",
                    quoteBackgroundColor: Color.fromRGBO(228, 255, 221, 1),
                    isQuoteOnLeft: false, // Card then Quote
                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                          '/tourDetails'
                      );
                    },
                  ),
                  const SizedBox(height: 30), // Gap between rows
                  TourGuideCard(
                    name: "Ella Marshall",
                    age: 23,
                    experience: "3 years experience, Informative and humorous",
                    quote: "Go where you feel most alive.",
                    avatar: "assets/ella.png",
                    quoteBackgroundColor: Color.fromRGBO(177, 222, 254, 1),
                    isQuoteOnLeft: true, // Quote then Card
                  ),
                  const SizedBox(height: 30), // Gap between rows
                  TourGuideCard(
                    name: "Tom Walker",
                    age: 21,
                    experience: "2 years experience, highly determined",
                    quote: "Explore. Dream. Discover.",
                    avatar: "assets/tom.png",
                    quoteBackgroundColor: Color.fromRGBO(255, 126, 126, 1),
                    isQuoteOnLeft: false, // Card then Quote
                  ),
                  const SizedBox(height: 30), // Gap between rows
                  TourGuideCard(
                    name: "Diana Craft",
                    age: 29,
                    experience: "8 years experience, passionate and professional",
                    quote: "Adventure is worthwhile.",
                    avatar: "assets/diana.png",
                    quoteBackgroundColor: Color.fromRGBO(171, 234, 211, 1),
                    isQuoteOnLeft: true, // Quote then Card
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}