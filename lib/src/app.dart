import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/domain/userAuthentication.dart';

import 'config/utils/managers/app_constants.dart';
import 'presentation/Cubits/appData_cubit/data_cubit.dart';
import 'presentation/Cubits/naviBar_cubit/app_bloc.dart';
import 'presentation/Cubits/navigation_cubit/navi_cubit.dart';
import 'presentation/Cubits/theme_bloc/theme_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<BaBBloc>(
          create: (context) => BaBBloc(),
        ),
        BlocProvider<UserRegisterBloc>(
          create: (context) => UserRegisterBloc(),
        ),
        BlocProvider<NaviCubit>(
          create: (context) => NaviCubit(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        // BlocProvider(
        //   create: (context) => LocalArticlesCubit(
        //     locator<DatabaseRepository>(),
        //   )..getAllSavedArticles(),
        // ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return AdaptiveTheme(
            light: ThemeState.lightTheme.themeData,
            dark: ThemeState.darkTheme.themeData,
            debugShowFloatingThemeButton: false,
            initial: AdaptiveThemeMode.dark,
            builder: (theme, darkTheme) => MaterialApp(
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                title: AppConstants.appTitle,
                theme: state.themeData,
                home: const AuthPage()),
          );
        },
      ),
    );
  }
}
