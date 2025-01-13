import 'dart:io';

import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_constants.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_enums.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_strings.dart';
import 'package:flutter_clean_coded/src/domain/usecases/notification_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_clean_coded/src/presentation/shared/components.dart';
import 'package:flutter_clean_coded/src/presentation/state/navigation_cubit/navi_cubit.dart';
import 'package:share_plus/share_plus.dart';

abstract class AppLists {
  static const List<String> appSupportedLanguages = [
    "English",
    "中文",
  ];
  static const List<String> genderTypes = ["Male", "Female"];

  static const List<String> appProblemTypes = [
    "Functional Bugs",
    "Security Bugs",
    "UI or Layout Issues",
    "Content Bugs",
    "Workflow Bugs",
    "Other Bugs"
  ];

  ///PROFILE
  static const List<String> profileCardsName = [
    "Edit Profile",
    "Settings",
    "Notifications",
    "About us",
    "Report a problem",
    "Logout"
  ];

  static const List<IconData> profileCardsIcons = [
    Icons.edit_attributes_outlined,
    Ionicons.settings_outline,
    Ionicons.notifications_outline,
    Ionicons.flower_outline,
    Ionicons.alert_circle_outline,
    Icons.door_back_door_outlined,
  ];

  static const List<IconData> profileCardsEndIcons = [
    Ionicons.caret_forward_circle_outline,
    Ionicons.caret_forward_circle_outline,
    Icons.abc,
    Icons.abc,
    Icons.abc,
    Icons.abc,
  ];

  // static List<Function(BuildContext)> profileCardsPages = [
  //   (context) {
  //     NaviCubit.get(context).navigate(
  //         context,
  //         const EditProfileScreen(
  //           isFirstTimeUser: false,
  //           title: 'Profile',
  //         ));
  //   },
  //   (context) {
  //     NaviCubit.get(context).navigate(context, const SettingsPage());
  //   },
  //   (context) {
  //     NaviCubit.get(context).navigate(context, const NotificationPage());
  //   },
  //   (context) {
  //     NaviCubit.get(context).navigate(context, const AboutUsPage());
  //   },
  //   (context) {
  //     showLottieChoiceDialog(
  //         icon: Ionicons.thunderstorm_outline,
  //         iconColor: AppColors.primaryLight,
  //         context: context,
  //         title: "Bug Reporting",
  //         noText: "Contact",
  //         onNo: () {
  //           NaviCubit.get(context).pop(context);
  //         },
  //         content:
  //             "Please make a report ONLY if there is a bug (Technical Issue).\nOtherwise please make a Feedback Ticket. Are you sure to proceed?",
  //         onYes: () {
  //           NaviCubit.get(context)
  //               .navigate(context, const AppProblemReportScreen());
  //         });
  //   },
  //   (context) {
  //     // RemoteDataCubit.get(context).logoutUser(context);
  //   },
  // ];

  ///

  ///Settings
  static const List<String> settingsCardsName = [
    "Change Password",
    "Delete Account",
    "Switch Language",
    "Share",
    "Check for updates",
    "App Version: ${AppConstants.appVersion}",
  ];

  static const List<IconData> settingsCardsIcons = [
    Ionicons.lock_closed_outline,
    Ionicons.remove_circle_outline,
    Ionicons.language_outline,
    Ionicons.share_outline,
    Ionicons.download_outline,
    Ionicons.terminal_outline,
  ];

  static const List<IconData> settingsCardsEndIcons = [
    Ionicons.caret_forward_circle_outline,
    Icons.abc,
    Ionicons.repeat_outline,
    Icons.abc,
    Icons.abc,
    Icons.abc,
  ];

  static List<Function> settingsCardsPages = [
    (context) {
      showChoiceDialog(
          context: context,
          title: "Reset Password",
          content:
              "We will send you an email to reset your password, do you want to proceed?",
          onYes: () async {
            //   var userModel = await LocalDataCubit.get(context)
            //       .getSharedMap(AppLocalConstants.savedLocalUser);
            //   NaviCubit.get(context).navigate(
            //       context,
            //       ChangePasswordScreen(
            //         userEmail: UserModel.fromJson(userModel).email,
            //         isAnonRequest: false,
            //       ));
          });
    },
    (context) async {
      // var userModel = await LocalDataCubit.get(context)
      //     .getSharedMap(AppLocalConstants.savedLocalUser);
      // showChoiceDialog(
      //     context: context,
      //     title: "Irreversible Action",
      //     content: "Are you sure you want to delete your account?",
      //     onYes: () async {
      //       await RemoteDataCubit.get(context)
      //           .deleteUserAccount(UserModel.fromJson(userModel).email, context)
      //           .then(
      //         (deleted) {
      //           if (deleted) {
      //             NaviCubit.get(context).navigateToSliderLogout(context);
      //           }
      //         },
      //       );
      // });
    },
    (context) {
      showAppLanguageDialog(context: context);
    },
    (context) async {
      if (Platform.isIOS) {
        await Share.shareUri(Uri.parse(AppSocialLinks.appleStoreURL));
      } else {
        await Share.shareUri(Uri.parse(AppSocialLinks.playStoreURL));
      }
    },
    (context) async {
      //todo
      if (Platform.isIOS) {
        openUrl(AppSocialLinks.appleStoreURL);
      } else {
        openUrl(AppSocialLinks.playStoreURL);
      }
      // showToast(
      //     "You are using the latest version ${AppLocalConstants.appVersion}",
      //     AppColors.primaryColor,
      //     context);
    },
    (context) async {
      await Clipboard.setData(
          const ClipboardData(text: "LKE Group ${AppConstants.appVersion}"));
      showToast("Copied to clipboard", AppColors.primaryColor, context);
    },
  ];

  ///ABOUT US
  static List<String> aboutUsCardsName = [
    "Terms & Conditions",
    "Refund Policy",
    "Rate our Application",
  ];

  static const List<IconData> aboutUsCardsIcons = [
    Ionicons.construct_outline,
    Ionicons.diamond_outline,
    Ionicons.compass_outline,
  ];

  static const List<IconData> aboutUsCardsEndIcons = [
    Ionicons.caret_forward_circle_outline,
    Ionicons.caret_forward_circle_outline,
    Icons.abc,
  ];

  static List<Function> aboutUsCardsPages = [
    (context) {
      // NaviCubit.get(context)
      //     .navigate(context, const TermsAndConditionsScreen());
    },
    (context) {
      // NaviCubit.get(context).navigate(context, const RefundPolicyScreen());
    },
    (context) {
      if (Platform.isIOS) {
        openUrl(AppSocialLinks.appleStoreURL);
      } else {
        openUrl(AppSocialLinks.playStoreURL);
      }
    },
  ];

  //My Property
  static List<ToggleButtonModel> notificationButtonsItemLists = [
    ToggleButtonModel(NotificationsType.Bookings_Notification.name, true),
    ToggleButtonModel(NotificationsType.News_Notification.name, true),
    ToggleButtonModel(NotificationsType.Welcome_Message.name, true),
    ToggleButtonModel(NotificationsType.Feedback_Notification.name, true),
  ];

  static List<ToggleButtonModel> appSettingsButtonsItemLists = [
    ToggleButtonModel(AppButtonsType.Allow_Home_Scrolling.name, true),
  ];
}
