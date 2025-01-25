import 'package:flutter/material.dart';
import 'package:tour_mate/widgets/BuildDestinationCard.dart';

class AdventureScreen extends StatelessWidget {
  const AdventureScreen({super.key});

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
            // Section with Name and Profile
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
                    backgroundImage: AssetImage(
                        'assets/profile.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Tagline
            const Center(
              child: Text.rich(
                TextSpan(
                  text: "Let’s ",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "travel ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "now",
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            // Search Bar
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
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
            const SizedBox(height: 30),

            // Recommended Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recommended Cards
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.95,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (_destinationCities[index] == 'Paris') {
                      Navigator.pushNamed(context, '/placeDetails');
                    }
                  },
                  child: BuildDestinationCard(
                    imagePath: 'assets/${_destinationImages[index]}',
                    city: _destinationCities[index],
                    country: _destinationCountries[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static const _destinationImages = [
    'paris.jpg',
    'istanbul.jpg',
    'london.jpg',
    'vienna.jpg',
  ];

  static const _destinationCities = [
    'Paris',
    'Istanbul',
    'London',
    'Vienna',
  ];

  static const _destinationCountries = [
    'France',
    'Turkey',
    'England',
    'Austria',
  ];
}