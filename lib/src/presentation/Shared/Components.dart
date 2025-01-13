import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clean_coded/src/core/localization/app_locale.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_enums.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_extensions.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_lists.dart';
import 'package:flutter_clean_coded/src/domain/usecases/user_usecase.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

import '../state/navigation_cubit/navi_cubit.dart';
import 'widgets_builder.dart';

bool isGuestMode = false;

double getHeight(int percent, context) {
  return (MediaQuery.of(context).size.height * (percent / 100)).toDouble();
}

SizedBox getCube(double percent, context) {
  return SizedBox(
    width: (MediaQuery.of(context).size.width * (percent / 100)).toDouble(),
    height: (MediaQuery.of(context).size.height * (percent / 100)).toDouble(),
  );
}

double getWidth(int percent, context) {
  return (MediaQuery.of(context).size.width * (percent / 100)).toDouble();
}

Widget loadingAnimation({Widget? loadingType}) {
  if (loadingType != null) {
    return loadingType;
  } else {
    return Center(
        child: LoadingAnimationWidget.waveDots(
            color: AppColors.primaryColor, size: 30));
  }
}

bool isKeyboardOpen(BuildContext context) {
  final viewInsets = MediaQuery.of(context).viewInsets.bottom;
  return viewInsets > 0; // Returns true if keyboard is open
}

Widget padBox({size}) {
  return Padding(padding: EdgeInsets.all(size ?? 10));
}

///Custom TextField
Widget textFieldA({
  // here if you put in before the { it is required by default but if you put after it you need to say required
  Key?
      key, //the difference is that inside {} it can be optional if you want to enforce input when call use "required"
  required TextEditingController controller,
  required String hintText,
  bool? obscureText = false, //optional
  TextAlign textAlign = TextAlign.start, //optional
  Icon? prefixIcon,
  FocusNode? focusNode,
  double? internalPadding,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
}) {
  return TextField(
    key: key,
    controller: controller,
    obscureText: obscureText ?? false,
    cursorColor: AppColors.primaryColor,
    textAlign: textAlign,
    autofocus: false,
    onTap: () {},
    readOnly: true,
    focusNode: focusNode,
    decoration: InputDecoration(
      hintText: hintText,
      fillColor: AppColors.primaryColor,
      contentPadding: EdgeInsets.all(internalPadding ?? 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      prefixIcon: prefixIcon,
      prefixIconColor: AppColors.primaryColor,
      filled: true,
    ),
    onChanged: onChanged,
    onSubmitted: onSubmitted,
  );
}

///Custom Button
Widget buttonA({
  final Function()? onPressed,
  required final String buttonText,
  int? height,
  int? width,
  Color? color,
  int? borderSize,
  Color? textColor,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: (height ?? 55).toDouble(),
      width: (height ?? 275).toDouble(),
      decoration: BoxDecoration(
        color: (color ?? AppColors.primaryColor),
        borderRadius: BorderRadius.circular(
          (borderSize ?? 17).toDouble(),
        ),
      ),
      child: Center(
        child: textC(buttonText,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 22)),
      ),
    ),
  );
}

//Show a toast
void showToast(String text, Color color, context) => toastification.show(
      context: context,
      title: textC(text),
      alignment: Alignment.bottomCenter,
      primaryColor: color,
      dragToClose: true,
      showProgressBar: true,
      icon: const Icon(Icons.info_outlined),
      autoCloseDuration: const Duration(seconds: 3),
    );

Widget getDivider(context) {
  return Divider(
    endIndent: getWidth(17, context),
    indent: getWidth(17, context),
    thickness: 1,
    color: AppColors.darkColor.withOpacity(.3),
  );
}

//Validate Text field
validateForm(
  GlobalKey<FormState> validateKey,
) {
  if (validateKey.currentState!.validate()) {
    validateKey.currentState!.save();
    return true;
  } else {
    return false;
  }
}

String getDateTimeToDay(String dateString) {
  try {
    String at = getLocaleText("at");
    DateTime date = DateTime.parse(dateString).toLocal();
    String time = "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
    if (date.day == DateTime.now().day) {
      return "${getLocaleText("Today")}, $at $time";
    }
    if (date.day == DateTime.now().day + 1) {
      return "${getLocaleText("Tomorrow")}, $at $time";
    }
    if (date.day == DateTime.now().day - 1) {
      return "${getLocaleText("Yesterday")}, $at $time";
    }
    return ("${date.toUtc().day}, ${date.toUtc().month.dateMonthName.substring(0, 3)}. at: $time");
  } catch (e) {
    return getLocaleText("Recently");
  }
}

getFormatDate(date) {
  date ??= DateTime.now().toString();
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(date.toString()).toLocal();
  var outputFormat = DateFormat('yyyy-MM-dd');
  return outputFormat.format(inputDate);
}

void showLottieChoiceDialog(
    {required context,
    String? title,
    String? postTitle,
    String? content,
    isInfoDialog = false,
    Color? iconColor,
    IconData icon = Icons.question_mark_outlined,
    String yesText = "Yes",
    String noText = "No",
    required VoidCallback onYes,
    VoidCallback? onNo}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FadeInDown(
        duration: const Duration(milliseconds: 300),
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getCube(2, context),

                Icon(
                  icon,
                  size: 75,
                  color: iconColor ?? AppColors.primaryLight,
                ),
                getCube(5, context),
                textC(
                  title ?? "",
                  postText: postTitle ?? "",
                  style: const TextStyle(
                    fontSize: AppFontSize.s16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                getCube(1, context),
                // Content text
                textC(
                  content ?? "Are you Sure?",
                  style: const TextStyle(
                    fontSize: AppFontSize.s14,
                    color: AppColors.greyDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                getCube(3, context),
                // Buttons
                Visibility(
                  visible: !isInfoDialog,
                  replacement: SizedBox(
                    width: getWidth(35, context),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        NaviCubit.get(context).pop(context);
                        onYes();
                      },
                      child: textC(
                        yesText,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          NaviCubit.get(context).pop(context);
                          if (onNo != null) {
                            onNo();
                          }
                        },
                        child: textC(
                          noText,
                          style: const TextStyle(color: AppColors.blackColor),
                        ),
                      ),
                      SizedBox(
                        width: getWidth(35, context),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            NaviCubit.get(context).pop(context);
                            onYes();
                          },
                          child: textC(
                            yesText,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future showChoiceDialog(
    {required BuildContext context,
    String? title,
    String? content,
    bool showCancel = true,
    String yesText = "Ok",
    String noText = "Cancel",
    required Function onYes,
    Function? onNo}) {
  return (showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          title: textC(title ?? ""),
          titleTextStyle: const TextStyle(
              fontSize: AppFontSize.s18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDark),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          content: textC(content ?? "Are you Sure?"),
          actions: [
            showCancel
                ? TextButton(
                    child: textC(noText),
                    onPressed: () {
                      NaviCubit.get(context).pop(context);
                      if (onNo != null) {
                        onNo();
                      }
                    },
                  )
                : Container(),
            TextButton(
              child: textC(yesText),
              onPressed: () {
                NaviCubit.get(context).pop(context);
                onYes();
              },
            ),
          ],
        );
      }));
}

Future showAppLanguageDialog({required BuildContext context}) {
  return (showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          title: textC("Change Language:"),
          titleTextStyle: TextStyle(
              fontSize: getWidth(4, context),
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDark),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            Column(
              children: [
                ...List.generate(
                  AppLocale.values.length,
                  (index) {
                    return Container(
                      width: getWidth(70, context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withOpacity(0.2)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: GestureDetector(
                        onTap: () {
                          // NaviCubit.get(context).pop(context);
                          // LocalDataCubit.get(context)
                          //     .changeLocale(AppLocale.values[index]);
                          // NaviCubit.get(context).navigateToHome(context);
                        },
                        child: Text(
                            "   ${index + 1}  -    ${AppLists.appSupportedLanguages[index]}"),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        );
      }));
}

Future<TimeOfDay?> getTime({
  required BuildContext context,
  String? title,
  TimeOfDay? initialTime,
  String? cancelText,
  String? confirmText,
}) async {
  TimeOfDay? time = await showTimePicker(
    initialEntryMode: TimePickerEntryMode.dial,
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    cancelText: cancelText ?? getLocaleText("Cancel"),
    confirmText: confirmText ?? getLocaleText("Save"),
    helpText: title ?? getLocaleText("Select time"),
    builder: (context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );
    },
  );

  return time;
}

Future<String> getAppUserName(context) async {
  var userName = ((await UserUsecase().getUserProfile())).lastName;

  return userName.toUpperCase();
}

Future<String> getAppUserPhoto(context) async {
  try {
    var imageUrl = ((await UserUsecase().getUserProfile())).image.imageUrl;
    return imageUrl;
  } catch (e) {
    return '';
  }
}

void openUrl(String url) {
  var openUrl = Uri.parse(url);
  launchUrl(
    openUrl,
    mode: LaunchMode.externalApplication,
  );
}

String generateRandomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
}

int generateRandomInt(int length) {
  final random = Random();
  return random.nextInt(length);
}
