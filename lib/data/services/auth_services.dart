import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class SharedPrefsService {
  static final SharedPrefsService _instance = SharedPrefsService._internal();
  factory SharedPrefsService() => _instance;
  SharedPrefsService._internal();

  Future<void> saveUserData(String province, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('province', province);
    await prefs.setString('userId', userId);
  }

  Future<User?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final province = prefs.getString('province');
    final userId = prefs.getString('userId');

    if (province == null || userId == null) return null;
    return User(province: province, userId: userId);
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}