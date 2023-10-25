import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/domain/BottomBar_Bloc/BottomBar_bloc.dart';

import '../../Shared/Components.dart';
import '../../Shared/Singleton.dart';
import 'Login/LoginPage.dart';
import 'Registration/RegisterFirstPage.dart';
import 'Registration/RegisterSecondPage.dart';
import 'Registration/RegisterThirdPage.dart';

class SignLayout extends StatefulWidget {
  const SignLayout({super.key});

  @override
  State<SignLayout> createState() => _SignLayoutState();
}

class _SignLayoutState extends State<SignLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey.shade300),
        child: Column(
          children: [
            logoContainer(context),
            Expanded(
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: BlocBuilder<BottomBarBloc, BottomBarState>(
                      builder: (context, state) {
                    if (state is LoginScreen) {
                      return const Login();
                    }
                    if (state is RegisterScreenOne) {
                      return const RegisterFirstPage();
                    }
                    if (state is RegisterScreenTwo) {
                      return RegisterSecondPage(
                          previousUserData: Singleton().userDataToBeUploaded);
                    }
                    if (state is RegisterScreenThree) {
                      return RegisterThirdPage(
                          previousUserData: Singleton().userDataToBeUploaded);
                    } else {
                      return const Login();
                    }
                  })),
            )
          ],
        ),
      ),
    );
  }
}
