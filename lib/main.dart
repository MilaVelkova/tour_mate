import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_mate/providers/FavoritePlacesProvider.dart';
import 'package:tour_mate/screens/AdventureScreen.dart';
import 'package:tour_mate/screens/CameraScreen.dart';
import 'package:tour_mate/screens/CreateAccountScreen.dart';
import 'package:tour_mate/screens/DiaryDetailsScreen.dart';
import 'package:tour_mate/screens/DiaryListScreen.dart';
import 'package:tour_mate/screens/HomeScreen.dart';
import 'package:tour_mate/screens/LoginScreen.dart';
import 'package:tour_mate/screens/NewDiaryScreen.dart';
import 'package:tour_mate/screens/PlaceDetailsScreen.dart';
import 'package:tour_mate/screens/SelectPhotoScreen.dart';
import 'package:tour_mate/screens/SplashScreen.dart';
import 'package:tour_mate/screens/TourGuideDetailsScreen.dart';
import 'package:tour_mate/screens/TourGuideScreen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritePlacesProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TourMate',
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
         "/login": (context) => const LoginScreen(),
        "/create": (context) => const CreateAccountScreen(),
        "/home": (context) => const HomeScreen(),
        "/adventure": (context) => const AdventureScreen(),
        "/placeDetails": (context) => const PlaceDetailsScreen(),
        "/diaryList": (context) => const DiaryListScreen(),
        "/diaryDetails": (context) => const DiaryDetailsScreen(),
        "/newDiary": (context) => const NewDiaryScreen(),
        "/selectPhoto": (context) => const SelectPhotoScreen(),
         "/camera": (context) => const CameraScreen(),
        "/tourGuide": (context) => const TourGuideScreen(),
        "/tourDetails": (context) => const TourGuideDetailsScreen(),
      },
    );
  }
}
