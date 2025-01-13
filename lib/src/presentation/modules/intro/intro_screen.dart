import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_clean_coded/src/presentation/modules/authentication/user_auth/authentication_page.dart';
import 'package:flutter_clean_coded/src/presentation/modules/intro/intro_screen_viewmodel.dart';
import 'package:flutter_clean_coded/src/presentation/state/navigation_cubit/navi_cubit.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    IntroScreenViewmodel introScreenViewmodel = IntroScreenViewmodel();
    return IntroductionScreen(
      pages: introScreenViewmodel.pages,
      // showSkipButton: true,
      // skip: const Icon(Icons.skip),
      next: const Text("Next"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      onDone: () {
        NaviCubit.get(context).navigate(context, const AuthenticationLayout());
        // On Done button pressed
      },
      // onSkip: () {
      //   // On Skip button pressed
      // },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
