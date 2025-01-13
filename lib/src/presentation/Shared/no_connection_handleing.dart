import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_assets.dart';
import 'package:flutter_clean_coded/src/presentation/state/navigation_cubit/navi_cubit.dart';
import 'package:flutter/material.dart';

class NoConnectionError extends StatelessWidget {
  const NoConnectionError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.errorGif),
              const SizedBox(height: 10),
              const Text(
                'Connection Error!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
              const SizedBox(height: 40),
              const Text(
                "We are unable to connect to our server, please check your connection or try again another time.",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontSize: AppFontSize.s14),
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {
                  NaviCubit.get(context).navigateToHome(context);
                },
                child: const Text(
                  "Retry",
                  style: TextStyle(
                      fontSize: AppFontSize.s16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
