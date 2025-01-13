import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_assets.dart';
import 'package:flutter_clean_coded/src/presentation/modules/authentication/user_auth/cubit/user_auth_page_cubit.dart';
import 'package:flutter_clean_coded/src/presentation/modules/authentication/user_auth/screens/user_login_screen.dart';
import 'package:flutter_clean_coded/src/presentation/modules/authentication/user_auth/screens/user_signup_screen.dart';

import '../../../shared/components.dart';
import '../../../shared/widgets_builder.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';

class AuthenticationLayout extends StatefulWidget {
  const AuthenticationLayout({super.key});

  @override
  State<AuthenticationLayout> createState() => _AuthenticationLayoutState();
}

class _AuthenticationLayoutState extends State<AuthenticationLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAuthPageCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: getHeight(30, context),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(200)),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50)),
                    child: Image.asset(
                      AppAssets.teamMembers,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -1,
                  right: -1,
                  child: Container(
                      width: getWidth(40, context),
                      height: getHeight(18, context),
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.60),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(110),
                              bottomLeft: Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 10),
                        child: Image(
                          image: AssetImage(AppAssets.logoNbNt),
                        ),
                      )),
                )
              ],
            ),
            Expanded(
              child: BlocBuilder<UserAuthPageCubit, UserAuthPageState>(
                  builder: (context, state) {
                if (state is UserLoginState) {
                  return const LoginScreen();
                }
                if (state is UserSignupState) {
                  return const SignupScreen();
                } else {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      fadedText(
                          context: context,
                          text: "Welcome to LKE Group!",
                          textColor: AppColors.primaryColor,
                          paddingSize: const EdgeInsets.only(left: 20),
                          fontWeight: FontWeight.w600,
                          fontSize: getWidth(5, context)),
                      fadedText(
                          context: context,
                          text: "How would you like to Login?",
                          textColor: AppColors.primaryColor,
                          paddingSize: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 5),
                          fontWeight: FontWeight.w600,
                          fontSize: getWidth(3, context)),
                      getCube(2, context),
                      Center(
                        child: loadButton(
                            buttonElevation: 0,
                            context: context,
                            isLoadButton: false,
                            onPressed: () {
                              UserAuthPageCubit.get(context)
                                  .changeState(UserLoginState());
                            },
                            buttonText: 'Login',
                            fontSize: AppFontSize.s16),
                      ),
                      getCube(3, context),
                      Center(
                        child: loadButtonOutline(
                            context: context,
                            isLoadButton: false,
                            borderWidth: 0,
                            buttonText: 'Continue as a Guest',
                            buttonElevation: 10,
                            onPressed: () async {
                              startGuestMode();
                            },
                            fontSize: AppFontSize.s14),
                      ),
                      getCube(8, context),
                      fadedText(
                        context: context,
                        text: "Are you a new User?",
                        textColor: AppColors.darkColor,
                        paddingSize: const EdgeInsets.all(30),
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.s14,
                      ),
                      Center(
                        child: loadButton(
                          isLoadButton: false,
                          context: context,
                          onPressed: () {
                            UserAuthPageCubit.get(context)
                                .changeState(UserSignupState());
                          },
                          buttonElevation: 0,
                          buttonText: 'Sign Up',
                          borderCurveSize: 10,
                          backgroundColor: AppColors.darkColor,
                          fontSize: AppFontSize.s16,
                        ),
                      ),
                      getCube(5, context),
                    ],
                  );
                }
              }),
            ),
            appFooter(context),
          ],
        ),
      ),
    );
  }

  startGuestMode() async {
    isGuestMode = true;
    // await LocalDataCubit.get(context).savePlainData(
    //     AppLocalConstants.userLoginType, AppLocalConstants.guestModeAuth);
    // await RemoteDataCubit.get(context).loginUser(
    //     LoginModelRequest(
    //         email: AppLocalConstants.guestModeEmail,
    //         password: AppLocalConstants.guestModeAuth),
    //     true,
    //     context);
  }
}
