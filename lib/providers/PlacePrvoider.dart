import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PlaceProvider with ChangeNotifier {
  Map<String, dynamic>? placeData;

  Future<void> fetchPlaceData(String placeId) async {
    DatabaseReference ref = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: "https://tourmate-db17f-default-rtdb.europe-west1.firebasedatabase.app/",
    ).ref("destinations/$placeId");

    DatabaseEvent event = await ref.once();

    if (event.snapshot.value != null) {
      var data = event.snapshot.value;

      if (data is Map<dynamic, dynamic>) {
        placeData = Map<String, dynamic>.from(data);
      } else if (data is List) {
        placeData = {};
        for (int i = 0; i < data.length; i++) {
          if (data[i] != null) {
            placeData![i.toString()] = data[i];
          }
        }
      }

      notifyListeners();
    }
  }

}
