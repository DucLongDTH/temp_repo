import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static final shared = SharedPreference();

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final object = json.decode(prefs.getString(key)??"");
    return object;
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
