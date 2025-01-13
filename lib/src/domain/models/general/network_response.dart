import 'package:dio/dio.dart';

class ResponseModel {
  final bool _isSuccess;
  final String _message;
  final Response? _response;

  ResponseModel(this._isSuccess, this._message, [this._response]);

  String get message => _message;
  bool get isSuccess => _isSuccess;
  Response? get response => _response;
}
