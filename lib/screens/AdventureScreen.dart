import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:tour_mate/widgets/BuildDestinationCard.dart';

import '../providers/UserProvider.dart';

class AdventureScreen extends StatefulWidget {
  const AdventureScreen({super.key});

  @override
  _AdventureScreenState createState() => _AdventureScreenState();
}

class _AdventureScreenState extends State<AdventureScreen> {
  DatabaseReference ref = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://tourmate-db17f-default-rtdb.europe-west1.firebasedatabase.app/",
  ).ref("destinations");

  final List<String> _destinationImages = ['paris.jpg', 'istanbul.jpg', 'london.jpg', 'vienna.jpg'];
  final List<String> _destinationCities = ['Paris', 'Istanbul', 'London', 'Vienna'];
  final List<String> _destinationCountries = ['France', 'Turkey', 'England', 'Austria'];

  @override
  void initState() {
    super.initState();
    uploadDestinations();
  }

  void uploadDestinations() {
    for (int i = 0; i < _destinationCities.length; i++) {
      ref.child(i.toString()).set({
        "image": _destinationImages[i],
        "city": _destinationCities[i],
        "country": _destinationCountries[i],
      });
    }
  }

  Future<List<Map<String, String>>> fetchDestinations() async {
    DatabaseEvent event = await ref.once();
    if (event.snapshot.value == null) return [];

    var data = event.snapshot.value;

    List<Map<String, String>> destinations = [];

    if (data is List) {
      for (var item in data) {
        if (item is Map) {
          destinations.add({
            "image": item["image"] ?? "",
            "city": item["city"] ?? "",
            "country": item["country"] ?? "",
          });
        }
      }
    } else if (data is Map) {
      data.forEach((key, value) {
        if (value is Map) {
          destinations.add({
            "image": value["image"] ?? "",
            "city": value["city"] ?? "",
            "country": value["country"] ?? "",
          });
        }
      });
    }
    return destinations;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
            // Name and Profile
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${userProvider.firstName} \n ${userProvider.lastName}',
                    style: const TextStyle(
                      fontFamily: "Adamina",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.png'),
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
            Expanded(
              child: FutureBuilder(
                future: fetchDestinations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error loading data"));
                  }
                  List<Map<String, String>> destinations = snapshot.data ?? [];

                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/placeDetails');
                        },
                        child: BuildDestinationCard(
                          imagePath: 'assets/${destinations[index]["image"]}',
                          city: destinations[index]["city"]!,
                          country: destinations[index]["country"]!,
                        ),
                      );
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
