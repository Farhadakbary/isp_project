import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';
import '../../data/services/auth_services.dart';


class UserViewModel extends ChangeNotifier {

  final SharedPrefsService _prefsService = SharedPrefsService();
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> checkExistingUser() async {
    final prefs = await SharedPreferences.getInstance();
    _currentUser = await _prefsService.getUserData();
    notifyListeners();
  }

  Future<void> saveUser(String province, String userId) async {
    await _prefsService.saveUserData(province, userId);
    _currentUser = User(province: province, userId: userId);
    notifyListeners();
  }

  Future<void> logout() async {
    await _prefsService.clearData();
    _currentUser = null;
    notifyListeners();
  }
  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  void updateTabIndex(int index) {

    _currentTabIndex = index;
    notifyListeners();
  }
}