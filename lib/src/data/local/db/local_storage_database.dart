import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDatabase {
  final SharedPreferences sharedPreferences;

  LocalStorageDatabase({required this.sharedPreferences});

  /// Save a key-value pair as a string.
  Future<bool> save(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }

  /// Save a map (converted to JSON string) with a specified key.
  Future<bool> saveMap(String mapName, Map<String, dynamic> mapData) async {
    String jsonString = jsonEncode(mapData);
    return await sharedPreferences.setString(mapName, jsonString);
  }

  /// Save a list (converted to JSON string) with a specified key.
  Future<bool> saveList(String listName, List<dynamic> listData) async {
    String jsonString = jsonEncode(listData);
    return await sharedPreferences.setString(listName, jsonString);
  }

  /// Retrieve a string value by key.
  String? get(String key) {
    return sharedPreferences.getString(key);
  }

  /// Retrieve a map (decoded from JSON string) by key.
  Map<String, dynamic>? getMap(String mapName) {
    String? jsonString = sharedPreferences.getString(mapName);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  /// Retrieve a list (decoded from JSON string) by key.
  List<dynamic>? getList(String listName) {
    String? jsonString = sharedPreferences.getString(listName);
    if (jsonString != null) {
      return jsonDecode(jsonString) as List<dynamic>;
    }
    return null;
  }

  /// Remove a value by key.
  Future<bool> remove(String key) async {
    return await sharedPreferences.remove(key);
  }

  /// Clear all stored data.
  Future<bool> clear() async {
    return await sharedPreferences.clear();
  }
}
