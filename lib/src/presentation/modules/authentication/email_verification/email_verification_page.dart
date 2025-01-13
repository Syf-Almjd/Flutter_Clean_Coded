import 'package:animate_do/animate_do.dart';
import 'package:flutter_clean_coded/src/core/localization/app_locale.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../Shared/components.dart';
import '../../../Shared/widgets_builder.dart';
import '../../../state/navigation_cubit/navi_cubit.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool isOTPCorrect = false;
  TextEditingController otpPass = TextEditingController();
  String userEmail = '';
  @override
  initState() {
    getEmail();
    super.initState();
  }

  getEmail() async {
    // var userData = await LocalDataCubit.get(context)
    //     .getSharedMap(AppLocalConstants.currentLoginUser);
    // if (userData.isNotEmpty) {
    //   userEmail = LoginModelRequest.fromJson(userData).email;
    // }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textC("Verify Email"),
      ),
      body: ListView(
        children: [
          getCube(5, context),
          Container(
            margin: EdgeInsets.symmetric(horizontal: getWidth(7, context)),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.grey.withOpacity(0.2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FadeInUp(
                      from: 10,
                      delay: const Duration(milliseconds: 400),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Ionicons.ellipsis_horizontal_outline,
                          color: Colors.white,
                          size: getWidth(10, context),
                        ),
                      ),
                    ),
                    Expanded(
                        child: FadeInUp(
                            from: 20,
                            delay: const Duration(milliseconds: 500),
                            child: Image.asset(AppAssets.forgotImage))),
                  ],
                ),
                getCube(5, context),
                fadedText(
                    context: context,
                    text: "Check your Email!",
                    fontSize: AppFontSize.s14,
                    alignment: TextAlign.start,
                    fontWeight: FontWeight.w900),
                fadedText(
                    paddingSize:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    context: context,
                    fontWeight: FontWeight.w700,
                    text: "Email: $userEmail",
                    fontSize: AppFontSize.s14),
                getCube(2, context),
                FadeInUp(
                  from: 10,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Your OTP is incorrect";
                      }
                      return null;
                    },
                    controller: otpPass,
                    decoration: InputDecoration(
                      labelText: getLocaleText("OTP Code"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                      prefixIcon: const Icon(
                        Icons.do_not_disturb_on_total_silence_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                getCube(2, context),

                // getCube(5, context),
                // FadeInUp(from: 10, child: loadingAnimation()),
                // Center(
                //     child: FadeInUp(from: 10, child: Text(widget.userEmail))),
                // Center(
                //     child: FadeInUp(
                //         from: 10, child: textC("Unverified user status"))),
                // getCube(5, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        showChoiceDialog(
                            context: context,
                            title: "Logout",
                            content: "Are you sure you want to quit?",
                            onYes: () {
                              NaviCubit.get(context)
                                  .navigateToSliderLogout(context);
                            });
                      },
                      child: textC("Logout",
                          style: const TextStyle(fontSize: AppFontSize.s12)),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryLight),
                      onPressed: () async {
                        checkVerify();
                      },
                      icon: const Icon(
                        CupertinoIcons.checkmark_shield,
                        color: AppColors.white,
                      ),
                      iconAlignment: IconAlignment.start,
                      label: const Text(
                        "Verify & Continue",
                        style: TextStyle(
                            color: AppColors.white, fontSize: AppFontSize.s14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  checkVerify() async {
    // isOTPCorrect = await RemoteDataCubit.get(context)
    //     .checkUserOTP(userEmail, otpPass.text, context);
    // if (!isOTPCorrect) {
    //   return showToast("Your OTP is incorrect", AppColors.redColor, context);
    // }
    // bool isVerifiedUser =
    //     await RemoteDataCubit.get(context).getUserVerification(context);
    // if (mounted && isVerifiedUser) {
    //   NaviCubit.get(context).navigateToHome(context);
    // }
  }
}
