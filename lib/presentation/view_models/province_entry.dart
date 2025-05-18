import 'package:flutter/foundation.dart';

class ProvinceViewModel extends ChangeNotifier {
  String? _selectedProvince;

  String? get selectedProvince => _selectedProvince;

  void selectProvince(String province) {
    _selectedProvince = province;
    notifyListeners();
  }
}