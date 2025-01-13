import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_coded/src/data/services/remote_storage_service.dart';
import 'package:flutter_clean_coded/src/domain/usecases/user_usecase.dart';
import 'package:flutter_clean_coded/src/presentation/shared/widgets_builder.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final Dio _dio = getDioClient();
  late Map<String, dynamic> headers;

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  init() {
    String token = UserUsecase().getUserToken() ?? "";
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      "X-Timestamp": timestamp,
    };
  }

  addInterceptors({printNetLogs = false}) {
    // TODO: CheckPoint NO2
    // printNetLogs = (printNetLogs && kReleaseMode); //during release
    printNetLogs = (!kReleaseMode); //during debugging
    // printNetLogs = false;

    // _dio logger customization
    _dio.interceptors.clear();
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: printNetLogs,
        requestBody: printNetLogs,
        responseBody: printNetLogs,
        responseHeader: printNetLogs,
        error: printNetLogs,
        logPrint: (object) {
          if (printNetLogs) {
            printC(object.toString());
          }
        },
        request: printNetLogs,
        compact: printNetLogs,
        maxWidth: 120));

    // Method for making GET requests
    Future<Response> get(
        Map<String, dynamic> queryData, String endPoint, context,
        {bool printIt = false}) async {
      //Intercept Logs Adder
      addInterceptors(printNetLogs: printIt);

      try {
        var response = await _dio.get(getApiUrl(endPoint),
            options: Options(headers: headers), queryParameters: queryData);

        return response;
      } on DioException catch (e) {
        if (e.response != null &&
            e.response!.data is Map &&
            e.response?.statusCode != 404) {
          printC(e, isError: true);
          return e.response!;
        } else {
          printC(e, isError: true);
          rethrow;
        }
      }
    }

    // Method for making GET requests
    Future<Response> post(
        Map<String, dynamic> queryData, String endPoint, context, Map dataJson,
        {bool printIt = false, bool useAuth = false}) async {
      //Intercept Logs Adder
      addInterceptors(printNetLogs: printIt);
      // Adding authorization header if needed
      if (!useAuth) {
        headers.remove('Authorization');
      }
      try {
        var response = await _dio.post(getApiUrl(endPoint),
            options: Options(headers: headers),
            data: dataJson,
            queryParameters: queryData);

        return response;
      } on DioException catch (e) {
        if (e.response != null &&
            e.response!.data is Map &&
            e.response?.statusCode != 404) {
          printC(e, isError: true);
          return e.response!;
        } else {
          printC(e, isError: true);
          rethrow;
        }
      }
    }

    Future<Response> delete(
        Map<String, dynamic> queryData, String endPoint, context,
        {bool printIt = false}) async {
      //Intercept Logs Adder
      addInterceptors(printNetLogs: printIt);

      try {
        var response = await _dio.delete(getApiUrl(endPoint),
            options: Options(headers: headers), queryParameters: queryData);

        return response;
      } on DioException catch (e) {
        if (e.response != null &&
            e.response!.data is Map &&
            e.response?.statusCode != 404) {
          printC(e, isError: true);
          return e.response!;
        } else {
          printC(e, isError: true);
          rethrow;
        }
      }
    }

    Future<Response> put(
        Map<String, dynamic> queryData, String endPoint, context, Map dataJson,
        {bool printIt = false}) async {
      //Intercept Logs Adder
      addInterceptors(printNetLogs: printIt);

      try {
        var response = await _dio.put(getApiUrl(endPoint),
            options: Options(headers: headers),
            data: dataJson,
            queryParameters: queryData);

        return response;
      } on DioException catch (e) {
        if (e.response != null &&
            e.response!.data is Map &&
            e.response?.statusCode != 404) {
          printC(e, isError: true);
          return e.response!;
        } else {
          printC(e, isError: true);
          rethrow;
        }
      }
    }
  }
}
