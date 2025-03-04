import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';

  String get firstName => _firstName;
  String get lastName => _lastName;

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _firstName = prefs.getString('firstName') ?? '';
    _lastName = prefs.getString('lastName') ?? '';
    notifyListeners();
  }

  Future<void> saveUserData(String firstName, String lastName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    _firstName = firstName;
    _lastName = lastName;
    notifyListeners();
  }
}
