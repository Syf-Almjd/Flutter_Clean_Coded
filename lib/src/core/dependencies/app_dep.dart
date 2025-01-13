import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_coded/src/core/dependencies/setup/app_config_setup.dart';
import 'package:flutter_clean_coded/src/core/dependencies/setup/app_exception_setup.dart';
import 'package:flutter_clean_coded/src/core/dependencies/setup/app_firebase_setup.dart';
import 'package:flutter_clean_coded/src/core/dependencies/setup/app_notifications_setup.dart';
import 'package:flutter_clean_coded/src/core/utils/observers/app_bloc_obeserver.dart';
import 'package:flutter_clean_coded/src/core/dependencies/app_dep_injector.dart';
import 'package:flutter_clean_coded/src/data/remote/api/api_client.dart';
import 'package:flutter_clean_coded/src/presentation/state/navigation_cubit/navi_cubit.dart';
import 'package:pdf/widgets.dart';

class AppDependencies {
  static Future<void> init() async {
    await appDependencies();
  }

  static Future<void> appDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppDependencyInjector.init();

    await AppFirebaseSetup.init();
    await AppBlocObserver.init();
    await AppNotificationSetup.init();
    await AppConfigSetup.init();
    await AppExceptionSetup.init();
  }

  static List<BlocProvider> appBlocProviders() {
    return [
      BlocProvider<NaviCubit>(
        create: (context) => NaviCubit(),
      ),
    ];
  }

  static void newUserPermissions() {
    AppNotificationSetup().requestPermission();
  }
}
