import 'package:flutter/foundation.dart';

class IDEntryViewModel extends ChangeNotifier {
  String _userId = '';

  String get userId => _userId;

  void setUserId(String value) {
    _userId = value;
    notifyListeners();
  }
}