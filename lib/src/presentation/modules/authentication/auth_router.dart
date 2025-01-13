import 'package:flutter_clean_coded/src/core/dependencies/app_dep.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_enums.dart';
import 'package:flutter_clean_coded/src/domain/usecases/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter_clean_coded/src/presentation/modules/authentication/email_verification/email_verification_page.dart';

import '../../Shared/app_error_handle.dart';
import '../../shared/no_connection_handleing.dart';
import '../splash/splash_loading_screen.dart';
import '../splash/splash_screen.dart';

class AuthRouter extends StatelessWidget {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    bool loadStream = true;

    return FutureBuilder(
        future: InternetConnection().hasInternetAccess,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashLoadingScreen();
          }
          if (snapshot.data == false) {
            return const NoConnectionError();
          }
          return loadStream
              ? StreamBuilder(
                  stream: UserUsecase().getUserStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SplashLoadingScreen();
                    }

                    if (snapshot.hasError || snapshot.data == null) {
                      return const CustomError(
                        errorDetails:
                            FlutterErrorDetails(exception: "Server Error"),
                      );
                    }
                    if (snapshot.data == UserStatusType.newUser) {
                      AppDependencies.newUserPermissions();
                      return const SplashScreen();
                    }
                    // if (snapshot.data == UserStatusType.inCompleteProfileUser) {
                    //   return const EditProfileScreen(
                    //     isFirstTimeUser: true,
                    //     title: 'Complete Profile',
                    //   );
                    // }
                    if (snapshot.data == UserStatusType.unverifiedUser) {
                      return const EmailVerificationPage();
                    }

                    if (snapshot.data == UserStatusType.verifiedUser) {
                      return const SplashScreen();
                    } else {
                      return const SplashScreen();
                    }
                  },
                )
              // ignore: dead_code
              : const SplashScreen();
        });
  }
}
