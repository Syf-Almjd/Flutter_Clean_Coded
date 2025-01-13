import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_constants.dart';

import 'styles/app_colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.white,
        surfaceTintColor: AppColors.primaryColor.withOpacity(0.1)),
    cardColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
    ),

    //App Transition
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),

    // main colors of the app
    primaryColor: AppColors.primaryColor,
    shadowColor: AppColors.lowPriority,
    primaryColorDark: AppColors.darkColor,
    disabledColor: AppColors.grey,
    scaffoldBackgroundColor: AppColors.white,

    //Text Theme
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: AppConstants.appFontFamily,
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: AppConstants.appFontFamily,
        ),
  );
}

ThemeData getDarkApplicationTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.white,
        surfaceTintColor: AppColors.primaryColor.withOpacity(0.1)),
    cardColor: Colors.white,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primaryColor,
    ),
  );
}
