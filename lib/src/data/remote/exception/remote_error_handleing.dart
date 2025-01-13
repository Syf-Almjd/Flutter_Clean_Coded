import 'dart:io';

import 'package:dio/dio.dart';

class DioExceptionHandler {
  // Function to convert DioException to a user-friendly message
  static String handleError(error) {
    String errorDescription = "";

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to the server was cancelled.";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout with server.";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection with the server.";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with the server.";
          break;
        case DioExceptionType.badResponse:
          errorDescription = _handleResponseError(error.response);
          break;
        case DioExceptionType.unknown:
          if (error.error != null && error.error is SocketException) {
            errorDescription = "No Internet connection.";
          } else {
            errorDescription = "Unexpected error occurred.";
          }
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad Certificate, error in the Security.";
          break;

        case DioExceptionType.connectionError:
          errorDescription =
              "Connection error, please check you data connection.";
          break;
      }
    } else {
      errorDescription = "Unexpected error occurred.";
    }
    return errorDescription;
  }

  static String _handleResponseError(response) {
    // You can handle specific status codes or Dio's Responses here
    if (response != null && response.statusCode != null) {
      switch (response.statusCode) {
        case 400:
          return "Oops! It looks like there was a problem with your request. Please check it and try again.";
        case 401:
          return "You need to be logged in to do that. Please login and try again.";
        case 403:
          return "Please confirm your email and password!";
        case 404:
          return "We couldn’t find what you were looking for. It might have been moved or deleted.";
        case 500:
          return "Something went wrong on our end. We’re working to fix it, so please try again later.";
        default:
          return "Something unexpected happened (Error: ${response.statusCode}). Please try again later.";
      }
    } else {
      return "We encountered a problem while connecting to the server. Please check your internet connection and try again.";
    }
  }
}
