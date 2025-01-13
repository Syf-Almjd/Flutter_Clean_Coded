import 'package:flutter/cupertino.dart';

import '../../../presentation/Shared/app_error_handle.dart';

class AppExceptionSetup {
  static init() {
    ErrorWidget.builder =
        (FlutterErrorDetails details) => CustomError(errorDetails: details);
  }
}
