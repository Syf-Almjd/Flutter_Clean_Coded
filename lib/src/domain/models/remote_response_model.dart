class RemoteResponseModel {
  final bool isSuccess;
  final String message;
  final dynamic data;

  RemoteResponseModel({
    required this.isSuccess,
    required this.message,
    required this.data,
  });
}
