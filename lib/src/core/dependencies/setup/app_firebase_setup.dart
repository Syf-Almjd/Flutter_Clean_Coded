import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_coded/src/data/remote/firebase/firebase_options.dart';

class AppFirebaseSetup {
  static init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // if (kReleaseMode) {
    //   errorCrashReporting();
    // }
  }

//   static errorCrashReporting() {
//     FlutterError.onError = (errorDetails) {
//       FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//     };
//     // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
//     PlatformDispatcher.instance.onError = (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//       return true;
//     };
//   }
}
