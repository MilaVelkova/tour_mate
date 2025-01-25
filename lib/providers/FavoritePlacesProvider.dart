import 'package:flutter/foundation.dart';

class FavoritePlacesProvider with ChangeNotifier {
  final Set<String> _favoriteCities = {};

  bool isFavorite(String city) => _favoriteCities.contains(city);

  void toggleFavorite(String city) {
    if (_favoriteCities.contains(city)) {
      _favoriteCities.remove(city);
    } else {
      _favoriteCities.add(city);
    }
    notifyListeners();
  }
}