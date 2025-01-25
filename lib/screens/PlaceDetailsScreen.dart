import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/FavoritePlacesProvider.dart';
import '../widgets/ServiceItem.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section
            Stack(
              children: [
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/paris.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 0,
                  child: Consumer<FavoritePlacesProvider>(
                    builder: (context, provider, _) {
                      bool isFavorite = provider.isFavorite("Paris");
                      return FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          provider.toggleFavorite("Paris");
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.black),
                  const SizedBox(width: 8),
                  const Text(
                    "France",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                "Paris",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            //Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Vitae sapien viverra laoreet fusce cras nibh.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Reviews and Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      SizedBox(width: 8),
                      Text("4.0"),
                    ],
                  ),
                  const SizedBox(width: 32),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.rate_review),
                    label: const Text("Read Reviews"),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Icon(Icons.directions_car, color: Colors.black, size: 20),
                      SizedBox(width: 4),
                      Text("30 min by car"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Services Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                "Services in Paris",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Service List
            Column(
              children: [
                ServiceItem(
                  title: "Carrete Cafe",
                  subtitle: "Trocadero, Paris, France",
                  imagePath: "assets/carrete.jpg",
                  label: "Restaurant",
                  labelColor: Colors.orange.shade100,
                  labelIcon: Icons.restaurant,
                ),
                ServiceItem(
                  title: "Disneyland Park",
                  subtitle: "Bd de Parc, Paris, France",
                  imagePath: "assets/disneyland.jpg",
                  label: "Park",
                  labelColor: Colors.green.shade100,
                  labelIcon: Icons.park,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}