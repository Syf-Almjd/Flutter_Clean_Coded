import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_clean_coded/src/core/dependencies/app_dep_injector.dart';

class SecureStorageDatabase {
  final FlutterSecureStorage secureStorage;

  SecureStorageDatabase({required this.secureStorage});

  /// Save a key-value pair as a string.
  Future<void> save(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  /// Save a map (converted to JSON string) with a specified key.
  Future<void> saveMap(String mapName, Map<String, dynamic> mapData) async {
    String jsonString = jsonEncode(mapData);
    await secureStorage.write(key: mapName, value: jsonString);
  }

  /// Save a list (converted to JSON string) with a specified key.
  Future<void> saveList(String listName, List<dynamic> listData) async {
    String jsonString = jsonEncode(listData);
    await secureStorage.write(key: listName, value: jsonString);
  }

  /// Retrieve a string value by key.
  Future<String?> get(String key) async {
    return await secureStorage.read(key: key);
  }

  /// Retrieve a map (decoded from JSON string) by key.
  Future<Map<String, dynamic>?> getMap(String mapName) async {
    String? jsonString = await secureStorage.read(key: mapName);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  /// Retrieve a list (decoded from JSON string) by key.
  Future<List<dynamic>?> getList(String listName) async {
    String? jsonString = await secureStorage.read(key: listName);
    if (jsonString != null) {
      return jsonDecode(jsonString) as List<dynamic>;
    }
    return null;
  }

  /// Remove a value by key.
  Future<void> remove(String key) async {
    await secureStorage.delete(key: key);
  }

  /// Clear all stored data.
  Future<void> clear() async {
    await secureStorage.deleteAll();
  }
}
