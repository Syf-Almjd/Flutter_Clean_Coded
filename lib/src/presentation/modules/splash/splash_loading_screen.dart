import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/presentation/Shared/components.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Shared/widgets_builder.dart';

class SplashLoadingScreen extends StatefulWidget {
  const SplashLoadingScreen({super.key});

  @override
  State<SplashLoadingScreen> createState() => _SplashLoadingScreenState();
}

class _SplashLoadingScreenState extends State<SplashLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getCube(10, context),
          appLogoPreview(
              context: context,
              width: getWidth(25, context),
              wBackground: false),
          Center(
            child: loadingAnimation(
                loadingType: LoadingAnimationWidget.fourRotatingDots(
                    color: AppColors.primaryColor, size: 50)),
          ),
          fadedText(context: context, text: "Please wait..."),
          getCube(2, context)
        ],
      ),
    );
  }
}
