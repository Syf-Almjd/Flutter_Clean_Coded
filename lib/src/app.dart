import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/data/local/localData_cubit/local_data_cubit.dart';
import 'package:flutter_clean_architecture/src/presentation/Cubits/BottomBar_Bloc/BottomBar_bloc.dart';
import 'package:flutter_clean_architecture/src/presentation/Cubits/Theme_bloc/theme_bloc.dart';
import 'package:flutter_clean_architecture/src/presentation/Cubits/appNavi_cubit/navi_cubit.dart';

import 'config/utils/managers/app_constants.dart';
import 'data/remote/RemoteData_cubit/RemoteData_cubit.dart';
import 'domain/userAuth.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteDataCubit>(
          create: (context) => RemoteDataCubit(),
        ),
        BlocProvider<LocalDataCubit>(
          create: (context) => LocalDataCubit()..getSharedMap('currentuser'),
        ),
        BlocProvider<BottomBarBloc>(
          create: (context) => BottomBarBloc(),
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
