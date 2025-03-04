import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/UserProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 150),

            _buildCard(
              context,
              title: 'Adventure',
              subtitle: 'Find tours, adventures, activities',
              imagePath: 'assets/adventure.png',
              route: '/adventure',
              color: const Color.fromRGBO(254, 246, 218, 1),
            ),
            const SizedBox(height: 50),

            _buildCard(
              context,
              title: 'Diary',
              subtitle: 'Write all your experience',
              imagePath: 'assets/diary.png',
              route: '/diaryList',
              color: const Color.fromRGBO(255, 233, 224, 1),
            ),
            const SizedBox(height: 50),

            _buildCard(
              context,
              title: 'Tour Guide',
              subtitle: 'Let Tour guides navigate for you',
              imagePath: 'assets/guide.png',
              route: '/tourGuide',
              color: const Color.fromRGBO(192, 244, 239, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, {
    required String title,
    required String subtitle,
    required String imagePath,
    required String route,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: SizedBox(
          height: 110,
          child: Card(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Image.asset(
                imagePath,
                width: 60,
              ),
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}