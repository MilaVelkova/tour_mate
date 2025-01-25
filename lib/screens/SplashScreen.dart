import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mountain.png'),
            fit: BoxFit.cover,
          ),
        ),
        //Title
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
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

            //Buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
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
                      backgroundColor: Color.fromRGBO(5, 191, 171, 1),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 18,color: Colors.white),
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
                      backgroundColor: Color.fromRGBO(238, 139, 82, 1),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Create an account",
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
