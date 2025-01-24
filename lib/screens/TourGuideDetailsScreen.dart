import 'package:flutter/material.dart';
import 'package:tour_mate/widgets/ContactInfoWidget.dart';
import 'package:tour_mate/widgets/LanguageWidget.dart';
import 'package:tour_mate/widgets/SkillWidget.dart';

class TourGuideDetailsScreen extends StatelessWidget {
  const TourGuideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Back Button
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 50),
                  const Text(
                    "Tour Guide Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Allura',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Profile Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side: Name and Profile Text
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PETER WILLIAMS",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(5, 41, 60, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "PROFILE",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(5, 41, 60, 1),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          textAlign: TextAlign.center,
                          "Energetic and resourceful Tour Guide with several years of experience accompanying clients on trips and to various locations in different parts of the world. Adept at performing research in an effort to make optimal travel plans. Experienced in organizing itineraries according to time frames, weather, and events. Dedicated to providing clients with the best customer service and travel experience possible.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16), // Gap between left and right sections

                  // Right Side: Profile Picture
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/peter.png"), // Add profile image
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Skills, Languages, and Contact Info Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side: Skills
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "SKILLS",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(5, 41, 60, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: const [
                            SKillWidget(label: "Communication"),
                            SKillWidget(label: "Guided Tour Planning"),
                            SKillWidget(label: "Time Management"),
                            SKillWidget(label: "Adaptability"),
                            SKillWidget(label: "Advanced Planning"),
                            SKillWidget(label: "Project Management"),
                            SKillWidget(label: "Travel Knowledge"),
                            SKillWidget(label: "Organization"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16), // Gap between left and right sections

                  // Right Side: Languages and Contact Info
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Languages Section
                        const Text(
                          "LANGUAGES",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(5, 41, 60, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: const [
                            LanguageWidget(label: "English"),
                            LanguageWidget(label: "Spanish"),
                            LanguageWidget(label: "French"),
                            LanguageWidget(label: "Italian"),
                          ],
                        ),
                        const SizedBox(height: 70),

                        // Contact Info Section
                        const Text(
                          "CONTACT INFO",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(5, 41, 60, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const ContactInfoWidget(
                          icon: Icons.phone,
                          text: "212-390-7365",
                        ),
                        const SizedBox(height: 8),
                        const ContactInfoWidget(
                          icon: Icons.email,
                          text: "pwillims@gmail.com",
                        ),
                        const SizedBox(height: 8),
                        const ContactInfoWidget(
                          icon: Icons.link,
                          text: "linkedin.com/pwilliams",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}