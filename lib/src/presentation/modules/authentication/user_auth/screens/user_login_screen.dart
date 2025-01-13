import 'package:animate_do/animate_do.dart';
import 'package:flutter_clean_coded/src/core/localization/app_locale.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/src/presentation/modules/app/explore/explore_page.dart';
import 'package:flutter_clean_coded/src/presentation/modules/authentication/user_auth/cubit/user_auth_page_cubit.dart';

import '../../../../../domain/models/Authentication/login/user_login_model.dart';
import '../../../../Shared/components.dart';
import '../../../../Shared/widgets_builder.dart';
import '../../../../state/navigation_cubit/navi_cubit.dart';
import '../../password_reset/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _validateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _validateKey,
      child: ListView(
        padding:
            appCustomPadding(horizontal: 20, vertical: 50, context: context),
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  UserAuthPageCubit.get(context)
                      .changeState(UserAuthPageInitial());
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey,
                  size: getWidth(10, context),
                ),
              ),
              fadedText(
                  context: context,
                  text: "Welcome Back",
                  textColor: AppColors.darkColor,
                  fontSize: AppFontSize.s16,
                  fontWeight: FontWeight.w800),
              SizedBox(
                width: getWidth(10, context),
              )
            ],
          ),
          getCube(5, context),
          FadeInUp(
            from: 10,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  showToast("Your Email is incorrect!", AppColors.primaryColor,
                      context);
                  return "Your Email is incorrect";
                }
                return null;
              },
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(200)),
                labelText: getLocaleText("Email"),
                prefixIcon: const Icon(
                  Icons.alternate_email,
                  color: AppColors.primaryColor,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          getCube(5, context),
          FadeInUp(
            from: 10,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || value.length <= 3) {
                  // showToast(
                  //     "Wrong Password", AppColors.primaryColor, context);
                  return "Wrong Password";
                }
                return null;
              },
              controller: pass,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(200)),
                labelText: getLocaleText("Password"),
                prefixIcon: const Icon(
                  Icons.password_outlined,
                  color: AppColors.primaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
          ),
          getCube(2, context),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            child: InkWell(
              child: textC(
                "Forgot Password?",
                softWrap: true,
                style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                resetPassword();
                // NaviCubit.get(context)
                //     .navigate(context, const ForgotPasswordScreen());
              },
            ),
          ),
          getCube(5, context),
          loadButton(
              borderCurveSize: 10,
              context: context,
              buttonWidth: getWidth(100, context),
              textWeight: FontWeight.w600,
              fontSize: AppFontSize.s16,
              buttonText: "Login",
              onPressed: () {
                NaviCubit.get(context).navigate(context, const ExplorePage());
                // if (validateForm(_validateKey)) {
                //   submitRequest();
                // }
              }),
        ],
      ),
    );
  }

  resetPassword() {
    NaviCubit.get(context).navigate(context, const ForgotPasswordScreen());
    // if (validateForm(_validateKey)) {
    //
    //   showChoiceDialog(
    //       context: context,
    //       title: "Reset Password",
    //       content:
    //       "We will send you an email to reset your password, do you want to proceed?",
    //       onYes: () {
    //
    //       });
    // } else {
    //   showToast(
    //       "Please enter the last email and password you remember, then click on 'Forgot Password'",
    //       Colors.red,
    //       context);
    // }
  }

  submitRequest() {
    LoginModelRequest loginModel = LoginModelRequest(
      email: email.text,
      password: pass.text,
    );
    // .loginUser(loginModel, true, context);
  }
}
