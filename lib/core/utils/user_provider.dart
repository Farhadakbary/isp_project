import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String? _selectedProvince;
  String? _userId;

  String? get selectedProvince => _selectedProvince;
  String? get userId => _userId;

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    _selectedProvince = prefs.getString('province');
    _userId = prefs.getString('userId');
    notifyListeners();
  }

  Future<void> saveUserData(String province, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('province', province);
    await prefs.setString('userId', userId);
    _selectedProvince = province;
    _userId = userId;
    notifyListeners();
  }

  void clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _selectedProvince = null;
    _userId = null;
    notifyListeners();
  }
}