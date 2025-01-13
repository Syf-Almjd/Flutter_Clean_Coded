import 'package:animate_do/animate_do.dart';
import 'package:flutter_clean_coded/src/core/localization/app_locale.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_assets.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_extensions.dart';
import 'package:flutter_clean_coded/src/presentation/Shared/widgets_builder.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../Shared/components.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String userEmail;
  final bool isAnonRequest;

  const ChangePasswordScreen(
      {super.key, required this.userEmail, required this.isAnonRequest});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController otpPass = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newPasswordConfirm = TextEditingController();
  final _validateKey = GlobalKey<FormState>();
  bool isOTPCorrect = false;

  @override
  void initState() {
    resetPassword();
    super.initState();
  }

  resetPassword() async {
    // await RemoteDataCubit.get(context)
    //     .sendUserOTP(widget.userEmail, context)
    //     .then(
    //   (resat) {
    //     if (resat && mounted) {
    //       showToast("Please check your email for the OTP!",
    //           AppColors.primaryColor, context);
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appCustomCancelBar('Change Password', context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(10, context),
          vertical: getHeight(5, context),
        ),
        child: Form(
          key: _validateKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                              Ionicons.lock_open_outline,
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
                        text: "No worries!",
                        fontSize: AppFontSize.s16,
                        alignment: TextAlign.start,
                        fontWeight: FontWeight.w900),
                    // fadedText(
                    //     paddingSize: const EdgeInsets.symmetric(
                    //         vertical: 5, horizontal: 10),
                    //     context: context,
                    //     text: "No worries!",
                    //     textSize: getWidth(4, context)),
                    fadedText(
                        paddingSize: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        context: context,
                        text: "We have sent you an OTP",
                        fontSize: AppFontSize.s14),
                    fadedText(
                        paddingSize: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        context: context,
                        fontWeight: FontWeight.w700,
                        text: "Email: ${widget.userEmail.toCapitalize()}",
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
                    Visibility(
                        replacement: Center(
                          child: loadButton(
                              onPressed: () async {
                                // isOTPCorrect =
                                //     await RemoteDataCubit.get(context)
                                //         .checkUserOTP(widget.userEmail,
                                //             otpPass.text, context);
                                if (!isOTPCorrect) {
                                  showToast("Your OTP is incorrect",
                                      AppColors.redColor, context);
                                }
                                setState(() {});
                              },
                              buttonHeight: getHeight(5, context),
                              buttonWidth: getWidth(60, context),
                              buttonText: "Next",
                              context: context,
                              borderCurveSize: 10,
                              fontSize: AppFontSize.s18),
                        ),
                        visible: isOTPCorrect,
                        child: Column(
                          children: [
                            FadeInUp(
                              from: 10,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return getLocaleText("Too short password");
                                  }

                                  // Check if the password is less than 8 characters
                                  if (value.length < 8) {
                                    return getLocaleText(
                                        "At least 8 characters long");
                                  }

                                  // Check if the password does not contain at least one uppercase letter
                                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                    return getLocaleText(
                                        "Please add one uppercase letter");
                                  }

                                  // Check if the password does not contain at least one lowercase letter
                                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                                    return getLocaleText(
                                        "Please add one lowercase letter");
                                  }

                                  // Check if the password does not contain at least one digit
                                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                                    return getLocaleText(
                                        "Please add one digit");
                                  }

                                  return null;
                                },
                                controller: newPassword,
                                decoration: InputDecoration(
                                  labelText: "New Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  prefixIcon: const Icon(
                                    Icons.password_rounded,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            getCube(2, context),
                            FadeInUp(
                              from: 10,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value != newPassword.text) {
                                    return getLocaleText(
                                        "New Passwords doesn't match");
                                  }
                                  return null;
                                },
                                controller: newPasswordConfirm,
                                decoration: InputDecoration(
                                  labelText: "Confirm new password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  prefixIcon: const Icon(
                                    Icons.password_rounded,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            getCube(5, context),
                            Center(
                              child: loadButton(
                                  onPressed: () async {
                                    if (validateForm(_validateKey)) {
                                      await changePassSubmit();
                                    }
                                  },
                                  context: context,
                                  buttonHeight: getHeight(5, context),
                                  buttonWidth: getWidth(60, context),
                                  buttonText: "Set Password",
                                  borderCurveSize: 10,
                                  fontSize: AppFontSize.s14),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changePassSubmit() async {
    if (mounted) {
      // UserModel userProfile =
      //     await RemoteDataCubit.get(context).getUserProfile(context);
      // userProfile.password = newPassword.text;
      // userProfile.image = ImageModel(
      //     imageId: 0, imageIndex: 0, imageUrl: "null", uploadedAt: "null");
      if (mounted) {
        // await RemoteDataCubit.get(context)
        //     .updateUserProfile(userProfile, context);

        if (mounted) {
          //   await RemoteDataCubit.get(context)
          //       .loginUser(
          //           LoginModelRequest(
          //               email: widget.userEmail, password: newPassword.text),
          //           widget.isAnonRequest,
          //           context)
          //       .whenComplete(
          //     () {
          //       if (!widget.isAnonRequest) {
          //         NaviCubit.get(context).pop(context);
          //       }
          //     },
          //   );
        }
      }
    }
  }
}
