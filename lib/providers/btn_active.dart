import 'package:flutter/material.dart';
import 'package:tests/providers/last_page.dart';

class BtnHelper with ChangeNotifier {
  int _currentPage = Preferences.lastPage;

  int get currentPage => _currentPage;

  set currentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
