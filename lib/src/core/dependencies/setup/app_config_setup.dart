import 'package:flutter/services.dart';

class AppConfigSetup {
  static init() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
