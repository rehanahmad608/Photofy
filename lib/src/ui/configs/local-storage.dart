import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Storage _singleton = new Storage._internal();
  static SharedPreferences _sharedPreferences =
  SharedPreferences.getInstance() as SharedPreferences;
  factory Storage() {
    return _singleton;
  }

  static initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }

  static setValue(String key, String value) {
    _sharedPreferences.setString(key, value);
  }

  static getValue(String key) {
    return _sharedPreferences.getString(key);
  }

  static cleanData() {
    return _sharedPreferences.clear();
  }

  Storage._internal();
}
