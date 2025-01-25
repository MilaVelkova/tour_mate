import 'package:flutter/material.dart';

class TourGuideCard extends StatelessWidget {
  final String name;
  final int age;
  final String experience;
  final String quote;
  final String avatar;
  final Color quoteBackgroundColor;
  final bool isQuoteOnLeft;
  final VoidCallback? onPressed;

  const TourGuideCard({
    super.key,
    required this.name,
    required this.age,
    required this.experience,
    required this.quote,
    required this.avatar,
    required this.quoteBackgroundColor,
    this.isQuoteOnLeft = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: isQuoteOnLeft
              ? [
            // Quote Section
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: quoteBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Quote:\n$quote",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                        fontFamily: 'Allura',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),

            // Avatar and Info
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Avatar Image
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(avatar),
                    ),
                    const SizedBox(width: 12),
                    // Name, Age, and Experience
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Adamina'
                            ),
                          ),
                          Text(
                            "$age years",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            experience,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
              : [
            // Avatar and Info
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Avatar Image
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(avatar),
                    ),
                    const SizedBox(width: 12),
                    // Name, Age, and Experience
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Adamina'
                            ),
                          ),
                          Text(
                            "$age years",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            experience,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),

            // Quote Section
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: quoteBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Quote:\n$quote",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Allura',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}