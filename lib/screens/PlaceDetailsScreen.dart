import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1), // Background color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Diary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context,
                      '/newDiary'
                  );
                },
                child: SizedBox(
                  height: 110, // Increased card height
                  child: Card(
                    color: const Color.fromRGBO(255, 221, 221, 1), // Light yellow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      subtitle: const Text(
                        textAlign: TextAlign.center,
                        'Place details..',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      leading: Image.asset(
                        'assets/diary1.png', // Replace with your adventure image
                        width: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
//
//             // Search Bar
//             Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   const SizedBox(width: 16),
//                   const Icon(Icons.search, color: Colors.black),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search",
//                         hintStyle: TextStyle(color: Colors.black45),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//
//             // Recents
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Text(
//                   "Recents",
//                   style: TextStyle(
//                     fontFamily: 'Adamina',
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40),
//
//             // Paris
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40.0),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(
//                       context,
//                       '/diaryDetails'
//                   );
//                 },
//                 child: SizedBox(
//                   height: 80, // Increased card height
//                   child: Card(
//                     color: const Color.fromRGBO(228, 255, 221, 1), // Light yellow
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ListTile(
//                       leading: Image.asset(
//                         'assets/paris.jpg', // Replace with your adventure image
//                         width: 100,
//                       ),
//                       title: const Text(
//                         'PARIS, 2023',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'Adamina',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 50),
//
//             // Istanbul
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40.0),
//               // child: InkWell(
//               //   onTap: () {
//               //     Navigator.pushNamed(
//               //         context,
//               //         '/diary'
//               //     );
//               //   },
//                 child: SizedBox(
//                   height: 80, // Increased card height
//                   child: Card(
//                     color:const Color.fromRGBO(171, 234, 211, 1), // Light pink
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ListTile(
//                       leading: Image.asset(
//                         'assets/istanbul.jpg', // Replace with your diary image
//                         width: 60,
//                       ),
//                       title: const Text(
//                         'ISTANBUL, 2024',
//                         style: TextStyle(
//                           fontFamily: 'Adamina',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             // ),
//             const SizedBox(height: 50),
//
//             // Photo & Video Card
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40.0),
//               child: SizedBox(
//                 height: 110, // Increased card height
//                 child: Card(
//                   color: const Color.fromRGBO(192, 244, 239, 1), // Light blue
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: ListTile(
//                     leading: Image.asset(
//                       'assets/diary.png', // Replace with your photo & video image
//                       width: 40,
//                     ),
//                     title: const Text(
//                       'Photo & video',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24,
//                         color: Colors.black,
//                       ),
//                     ),
//                     subtitle: const Text(
//                       'Post all pictures and video from your adventure',
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
           ],
        ),
       ),
     );
   }
 }

