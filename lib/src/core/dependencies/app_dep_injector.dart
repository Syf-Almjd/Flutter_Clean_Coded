import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_clean_coded/src/data/local/db/local_storage_database.dart';
import 'package:flutter_clean_coded/src/data/local/db/secure_storage_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencyInjector {
  static Future<void> init() async {
    final getIt = getInstance();

    // Initialize SharedPreferences
    final sharedPreferencesInstance = await SharedPreferences.getInstance();
    const secureStorageInstance = FlutterSecureStorage();

    getIt.registerSingleton<LocalStorageDatabase>(
        LocalStorageDatabase(sharedPreferences: sharedPreferencesInstance));

    getIt.registerLazySingleton<SecureStorageDatabase>(
        () => SecureStorageDatabase(
              secureStorage: secureStorageInstance,
            ));

    // Register API-related services
    _registerApiServices(getIt);

    // Register other services and use cases
    // getIt.registerSingleton<GetUserUseCase>(GetUserUseCase(getIt<UserRepository>()));
  }

  static void _registerApiServices(GetIt getIt) {
    getIt.registerSingleton<Dio>(Dio());

    // getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));
    // getIt.registerSingleton<UserService>(UserService(getIt<ApiService>()));
    // getIt.registerSingleton<UserRepository>(UserRepository(getIt<UserService>()));
  }

  static GetIt getInstance() {
    return GetIt.instance;
  }

  static void reset() {
    GetIt.I.reset();
  }

  static void dispose() {
    GetIt.I.reset();
  }
}
