import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static int _lastPage = 0;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int get lastPage => _prefs.getInt('lastPage') ?? _lastPage;

  static set lastPage(int page) {
    _lastPage = page;
    _prefs.setInt('lastPage', page);
  }
}
