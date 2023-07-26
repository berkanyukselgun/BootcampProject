import 'dart:convert';

import 'package:akademi_bootcamp/core/constants/memory/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  SharedPrefsManager._();
  static late final SharedPrefsManager instance = SharedPrefsManager._();
  SharedPreferences? _preferences;
  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setBoolValue(SharedPrefsKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> setStringValue(SharedPrefsKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setMapValue(SharedPrefsKeys key, Map value) async {
    String encodedMap = jsonEncode(value);
    await _preferences!.setString(key.toString(), encodedMap);
  }

  bool getBoolValue(SharedPrefsKeys key) => _preferences!.getBool(key.toString()) ?? false;
  String getStringValue(SharedPrefsKeys key) => _preferences!.getString(key.toString()) ?? '';
  Map getMapValue(SharedPrefsKeys key) {
    String stringMap = _preferences!.getString(key.toString()) ?? "";
    Map map = jsonDecode(stringMap);
    return map;
  }
}
