import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_mate/providers/FavoritePlacesProvider.dart';

class BuildDestinationCard extends StatelessWidget{
  final String imagePath;
  final String city;
  final String country;

  BuildDestinationCard({required this.imagePath, required this.city, required this.country});
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoritePlacesProvider>(context);
    bool isFavorite = favoriteProvider.isFavorite(city);
    return Stack(
      children: [
        Card(
          color: const Color(0xFF98EBE0), // Set card background color
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      country,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Red Heart in the Top Right
        Positioned(
          top: 110,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8),
         child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
         ),
    ),
        ),
      ],
    );
  }


}