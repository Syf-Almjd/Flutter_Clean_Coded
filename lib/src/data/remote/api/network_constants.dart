abstract class AppNetworkConstants {
  // API
  static const String networkApiUrl = "http://146.190.6.47:9090";
  // static const String localApiUrl = "http://192.168.147.1:9000";
  static const String baseApiUrl = networkApiUrl;
  static const int apiTimeOut = 60;
  static const String contentType = "application/json";

  static const String signUpEndpoint = "/api/auths/signup";
  static const String loginEndpoint = "/api/auths/login";
  static const String adminAppSettingsEndPoint = "/api/settings";
}
