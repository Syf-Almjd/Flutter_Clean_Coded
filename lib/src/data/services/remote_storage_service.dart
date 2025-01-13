import 'package:dio/dio.dart';
import 'package:flutter_clean_coded/src/core/dependencies/app_dep_injector.dart';
import 'package:flutter_clean_coded/src/data/remote/api/network_constants.dart';

Dio getDioClient() {
  return AppDependencyInjector.getInstance().get<Dio>();
}

// Method to get API URL
String getApiUrl(String endpoint) {
  String apiUrl = '${AppNetworkConstants.baseApiUrl}$endpoint';
  return apiUrl;
}
