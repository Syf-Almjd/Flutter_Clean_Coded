import 'package:flutter_clean_coded/src/core/dependencies/app_dep_injector.dart';
import 'package:flutter_clean_coded/src/data/local/db/local_storage_database.dart';
import 'package:flutter_clean_coded/src/data/local/db/secure_storage_database.dart';

LocalStorageDatabase getLocalStorageService() {
  return AppDependencyInjector.getInstance().get<LocalStorageDatabase>();
}

SecureStorageDatabase getSecureStorageService() {
  return AppDependencyInjector.getInstance().get<SecureStorageDatabase>();
}
