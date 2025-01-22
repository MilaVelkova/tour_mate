import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity, // Ensures the container takes the full screen height
        width: double.infinity,  // Ensures the container takes the full screen width
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mountain.png'), // Path to your image
            fit: BoxFit.cover, // Makes the image cover the entire screen
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Positions text at the top and buttons at the bottom
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50), // Add some padding at the top
              child: Column(
                children: [
                  Text(
                    "Let's enjoy the",
                    style: TextStyle(
                      fontFamily: "Allura",
                      fontSize: 56,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Beautiful World",
                    style: TextStyle(
                      fontFamily: "Aladin",
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "with TourMate",
                    style: TextStyle(
                      fontFamily: "Allura",
                      fontSize: 56,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50), // Add padding to the bottom
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                            '/login'
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3AB6A2), // Teal color for the button
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            '/create'
                        );
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF19C65), // Orange color for the button
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Create an account",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
