import 'package:flutter_clean_coded/src/core/localization/app_locale.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_assets.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_enums.dart';
// import 'package:flutter_clean_coded/src/presentation/Shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/src/presentation/modules/authentication/user_auth/authentication_page.dart';
import 'package:flutter_clean_coded/src/presentation/modules/intro/intro_screen.dart';
import 'package:flutter_clean_coded/src/presentation/shared/components.dart';
import 'package:flutter_clean_coded/src/presentation/shared/widgets_builder.dart';
import 'package:lottie/lottie.dart';
// import 'package:rive/rive.dart';

// import '../../Shared/widgets_builder.dart';
import '../../state/navigation_cubit/navi_cubit.dart';

//This class is used to display the starting splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, right: 30),
            alignment: Alignment.topRight,
            child: OutlinedButton(
              onPressed: () {
                showToast("Only English is supported for now",
                    AppColors.primaryColor, context);
                // LocalDataCubit.get(context).changeLocale(
                //     appDefaultLocale == AppLocale.english
                //         ? AppLocale.chinese
                //         : AppLocale.english);
                // setState(() {});
              },
              child: textC("English", preText: "🌐  : "),
            ),
          ),
          Center(
            child: appLogoPreview(
                context: context,
                width: getWidth(100, context),
                height: getHeight(8, context),
                wBackground: false),
          ),
          textC(
            "Welcome to LKE Community!",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppFontSize.s14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          lottieNetworkContainer(
              height: getHeight(40, context),
              context: context,
              url:
                  "https://lottie.host/56eabded-b759-4908-856f-067582778316/YHen8tgqR0.json"),
          // Center(
          //   child: RiveAnimation.network(
          //     'https://rive.app/community/files/15060-29047-ballin-interactive/',
          //     fit: BoxFit.cover,
          //   ),
          // ),

          // Container(
          //   padding: const EdgeInsets.only(top: 20, bottom: 20),
          //   decoration: BoxDecoration(
          //     color: AppColors.primaryColor,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(20),
          //       topRight: Radius.circular(20),
          //     ),
          //   ),
          //   child: textC(
          //     "Welcome to LKE Community",
          //     style: TextStyle(color: AppColors.white),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          loadButtonOutline(
            context: context,
            isLoadButton: false,
            // borderWidth: 4,
            onPressed: () {
              NaviCubit.get(context).navigate(context, const IntroScreen());
            },
            buttonText: "Get Started!",
            fontSize: AppFontSize.s16,
          ),
          // loadButtonOutline(
          //   context: context,
          //   isLoadButton: false,
          //   onPressed: () {
          //     NaviCubit.get(context)
          //         .navigate(context, const AuthenticationLayout());
          //   },
          //   buttonText: "Skip",
          //   fontSize: AppFontSize.s16,
          // ),
          // gifPreview(
          //     context: context,
          //     filePath: appDefaultLocale == AppLocale.english
          //         ? AppAssets.splashGif
          //         : AppAssets.chineseSplashGif,
          //     height: getHeight(8, context)),

          // getCube(2, context),
        ],
      ),
    );
  }
}
