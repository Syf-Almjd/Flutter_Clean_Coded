import 'package:flutter_clean_coded/src/core/dependencies/app_dep.dart';
import 'package:flutter_clean_coded/src/core/themes/app_theme.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_constants.dart';
import 'package:flutter_clean_coded/src/presentation/state/navigation_cubit/navi_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/modules/authentication/auth_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppDependencies.appBlocProviders(),
        child: MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: AppConstants.appTitle,
            theme: getApplicationTheme(),
            home: const AuthRouter()));
  }
}
