import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_clean_coded/src/core/localization/app_locale.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_assets.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_enums.dart';
import 'package:flutter_clean_coded/src/data/local/constant/local_constants.dart';
import 'package:flutter_clean_coded/src/domain/usecases/notification_usecase.dart';
import 'package:flutter_clean_coded/src/presentation/state/navigation_cubit/navi_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as widgets;
import 'package:share_plus/share_plus.dart';

import 'components.dart';

Widget loadButton({
  double? buttonHeight,
  double? buttonWidth,
  Color? textColor,
  double? fontSize,
  double? borderCurveSize,
  int? delayTime,
  Color? backgroundColor,
  FontWeight? textWeight,
  double? animateDistance,
  Curve? curvingStyle,
  EdgeInsets? buttonPadding,
  double? buttonElevation,
  required Function() onPressed,
  required context,
  required String buttonText,
  bool isLoadButton = true,
}) {
  // return BlocBuilder<RemoteDataCubit, RemoteAppStates>(
  // builder: (context, state) {
  // if (state is GettingData && isLoadButton) {
  // Timer(
  //   const Duration(seconds: 1),
  //   () async {
  //     await RemoteDataCubit().dataDelayed(context);
  //   },
  // );
  // return loadingAnimation(
  //     loadingType: LoadingAnimationWidget.beat(
  //         color: backgroundColor ?? AppColors.primaryColor,
  //         size: getWidth(10, context)));
  // } else {
  return FadeInUp(
    from: animateDistance ?? 10,
    curve: curvingStyle ?? Curves.fastEaseInToSlowEaseOut,
    delay: Duration(milliseconds: delayTime ?? 10),
    child: Container(
      width: buttonWidth ?? getWidth(80, context),
      height: buttonHeight ?? 60.0,
      padding: buttonPadding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderCurveSize ?? 50.0),
          ),
          elevation: buttonElevation ?? 5.0,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onPressed: onPressed,
        child: textC(
          buttonText,
          style: TextStyle(
            fontWeight: textWeight ?? FontWeight.w600,
            // Increased weight for better readability
            fontSize: fontSize ?? 15,
            // Slightly larger text size
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    ),
  );
  //   }
  // });
}

Widget loadingNetworkContainer({
  required String url,
  required context,
  double? width,
  double? height,
}) {
  return SizedBox(
    width: width ?? getWidth(100, context),
    height: height ?? getHeight(10, context),
    child: Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        }
      },
      errorBuilder: (context, url, error) => const Icon(
          Ionicons.cloud_offline_outline,
          color: AppColors.primaryLight),
    ),
  );
}

Widget lottieNetworkContainer({
  required String url,
  required context,
  double? width,
  double? height,
}) {
  return SizedBox(
    width: width ?? getWidth(100, context),
    height: height ?? getHeight(10, context),
    child: Lottie.network(
      url,
      fit: BoxFit.cover,
      options: LottieOptions(
        enableMergePaths: true,
      ),
      errorBuilder: (context, url, error) => const Icon(
          Ionicons.cloud_offline_outline,
          color: AppColors.primaryLight),
    ),
  );
}

Widget appLogoPreview(
    {required context, double? width, double? height, wBackground = true}) {
  return Hero(
    transitionOnUserGestures: true,
    tag: AppLocalConstants.logoHero,
    child: FadeInDown(
      child: SizedBox(
        width: width ?? getWidth(20, context),
        height: height ?? getHeight(30, context),
        child:
            Image.asset(wBackground ? AppAssets.appLogoWB : AppAssets.appLogo),
      ),
    ),
  );
}

gifPreview(
    {required context,
    required String filePath,
    double? width,
    double? height}) {
  return SizedBox(
    width: width ?? getWidth(100, context),
    height: height ?? getHeight(10, context),
    child: Image.asset(
      filePath,
    ),
  );
}

paymentLoading() {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          AppAssets.paymentLoadingGif,
          scale: 5,
        ),
        loadingAnimation(
            loadingType: LoadingAnimationWidget.threeArchedCircle(
                color: AppColors.primaryLight, size: 50)),
        Container()
      ],
    ),
  );
}

searchingAnimation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FadeInUp(
        from: 10,
        delay: const Duration(milliseconds: 400),
        child: Image.asset(
          AppAssets.searchMainGif,
          scale: 10,
        ),
      ),
      loadingAnimation()
    ],
  );
}

searchingHouseAnimation() {
  return FadeInUp(
    from: 10,
    delay: const Duration(milliseconds: 400),
    child: Image.asset(
      AppAssets.houseBSearchingGif,
      scale: 5,
    ),
  );
}

Widget fadedText({
  required context,
  required String text,
  String? preText,
  String? postText,
  Color? textColor,
  double? fontSize,
  int? delayTime,
  int? maxLinesSize,
  FontWeight? fontWeight,
  Curve? curvingStyle,
  TextAlign? alignment,
  EdgeInsets? paddingSize,
  TextOverflow? textOverFlow = TextOverflow.clip,
  double? animateDistance,
}) {
  return FadeInDown(
      from: animateDistance ?? 10,
      delay: Duration(milliseconds: delayTime ?? 10),
      curve: curvingStyle ?? Curves.fastEaseInToSlowEaseOut,
      child: Padding(
        padding: paddingSize ?? const EdgeInsets.all(8.0),
        child: textC(
          overflow: textOverFlow,
          text,
          preText: preText ?? '',
          postText: postText ?? '',
          maxLines: maxLinesSize,
          textAlign: alignment ?? TextAlign.start,
          style: TextStyle(
              fontSize: fontSize ?? AppFontSize.s14,
              color: textColor ?? AppColors.primaryColor,
              fontWeight: fontWeight ?? FontWeight.w400),
        ),
      ));
}

Widget fadedIconText({
  required context,
  required String text,
  String? preText,
  String? postText,
  Color? textColor,
  Icon? icon,
  double? fontSize,
  int? delayTime,
  int? maxLinesSize,
  FontWeight? fontWeight,
  Curve? curvingStyle,
  TextAlign? alignment,
  EdgeInsets? paddingSize,
  TextOverflow? textOverFlow = TextOverflow.clip,
  double? animateDistance,
}) {
  return FadeInDown(
      from: animateDistance ?? 10,
      delay: Duration(milliseconds: delayTime ?? 10),
      curve: curvingStyle ?? Curves.fastEaseInToSlowEaseOut,
      child: Padding(
        padding: paddingSize ?? const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            icon ?? Container(),
            if (icon != null) getCube(2, context),
            textC(
              overflow: textOverFlow,
              text,
              preText: preText ?? '',
              postText: postText ?? '',
              maxLines: maxLinesSize,
              textAlign: alignment ?? TextAlign.start,
              style: TextStyle(
                  fontSize: fontSize ?? AppFontSize.s14,
                  color: textColor ?? AppColors.primaryColor,
                  fontWeight: fontWeight ?? FontWeight.w400),
            ),
          ],
        ),
      ));
}

Widget appFooter(context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Wrap(
      direction: Axis.horizontal,
      children: [
        const Divider(),
        Center(
          child: textC("LKE GROUP MANAGEMENT & SERVICES ©",
              textAlign: TextAlign.center),
        ),
        getCube(1, context)
      ],
    ),
  );
}

Widget appCancelButton(context, {EdgeInsets? margin, Function()? onTap}) {
  return GestureDetector(
    onTap: onTap ??
        () {
          NaviCubit.get(context).pop(context);
        },
    child: Container(
        margin: margin ?? const EdgeInsets.only(top: 40, left: 30),
        alignment: Alignment.topLeft,
        //padding: const EdgeInsets.all(30),
        height: getHeight(10, context),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.darkColor),
        child: const Center(
            child: Icon(
          Ionicons.close_outline,
          color: Colors.white,
          size: 25,
        ))),
  );
}

Widget appBackButton(context, {EdgeInsets? margin, Function()? onTap}) {
  return GestureDetector(
    onTap: onTap ??
        () {
          NaviCubit.get(context).pop(context);
        },
    child: Container(
        margin: margin ?? const EdgeInsets.only(top: 40, left: 30),
        alignment: Alignment.topLeft,
        //padding: const EdgeInsets.all(30),
        height: getHeight(10, context),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.darkColor),
        child: const Center(
            child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 25,
        ))),
  );
}

Widget appMenuButton(context, bool isOpen) {
  return FadeIn(
    curve: Curves.ease,
    child: Container(
      // margin: const EdgeInsets.only(top: 40, left: 30),
      alignment: Alignment.topRight,
      padding: const EdgeInsets.all(15),
      height: getHeight(10, context),
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: AppColors.darkColor),
      child: Center(
          child: Icon(
        isOpen ? Icons.close_rounded : Icons.menu,
        color: Colors.white,
        size: 30,
      )),
    ),
  );
}

Widget loadButtonOutline({
  double? buttonHeight,
  double? buttonWidth,
  Color? textColor,
  double? fontSize,
  double? borderWidth,
  int? delayTime,
  double? borderCurveSize,
  double? animateDistance,
  Curve? curvingStyle,
  double? borderRadius,
  double? buttonElevation,
  required Function() onPressed,
  required String buttonText,
  required context,
  bool isLoadButton = true,
}) {
  return FadeInUp(
    from: animateDistance ?? 10,
    curve: curvingStyle ?? Curves.fastEaseInToSlowEaseOut,
    delay: Duration(milliseconds: delayTime ?? 10),
    child: Container(
      width: buttonWidth ?? getWidth(80, context),
      height: buttonHeight ?? 60.0,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderCurveSize ?? 40.0),
          ),
          elevation: buttonElevation ?? 00,
          side: BorderSide(
              color: AppColors.primaryColor, width: borderWidth ?? 5),
        ),
        onPressed: onPressed,
        child: textC(
          buttonText,
          style: TextStyle(
              fontSize: fontSize ?? AppFontSize.s16,
              color: textColor ?? AppColors.darkColor),
        ),
      ),
    ),
  );
}

///For photo preview
Widget previewImage(
    {double padding = 5.0,
    Color backgroundColor = Colors.transparent,
    double photoRadius = 15.0,
    required fileUser,
    BoxFit fit = BoxFit.fill,
    bool isUrl = true,
    bool editable = false,
    VoidCallback? onTap,
    required context}) {
  if (!isUrl) {
    try {
      fileUser = base64Decode(fileUser);
    } catch (e) {
      isUrl = true;
    }
  }
  return GestureDetector(
    onTap: onTap ?? () {},
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(photoRadius),
                    child: isUrl
                        ? CachedNetworkImage(
                            fit: fit,
                            imageUrl: fileUser,
                            progressIndicatorBuilder: (context, url, progress) {
                              return Center(child: loadingAnimation());
                            },
                            errorWidget: (context, url, error) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    CupertinoIcons.photo,
                                    size: 40,
                                    color: AppColors.greyDark,
                                  ),
                                  textC(
                                    "Not Uploaded",
                                    style: const TextStyle(
                                      fontSize: AppFontSize.s10,
                                      color: AppColors.primaryDark,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              );
                            })
                        : Image.memory(
                            fileUser,
                            fit: fit,
                          ))),
          ),
        ),
        Visibility(
          visible: editable,
          replacement: Container(),
          child: Positioned(
            bottom: 7,
            right: 7,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black12),
              child: const Icon(
                Icons.mode_edit_outline_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

coverPreviewImage(fileUser) {
  // var isUrl = false;
  // try {
  //   fileUser = base64Decode(fileUser);
  // } catch (e) {
  //   isUrl = true;
  // }
  // return isUrl
  //     ?
  return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: fileUser,
      progressIndicatorBuilder: (context, url, progress) {
        return Center(child: loadingAnimation());
      },
      errorWidget: (context, url, error) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.photo,
              size: 40,
              color: AppColors.greyDark,
            ),
            textC(
              "Not Uploaded",
              style: const TextStyle(
                fontSize: AppFontSize.s10,
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        );
      });
  // : Image.memory(
  //     fileUser,
  //     fit: BoxFit.cover,
  //     errorBuilder: (context, error, stackTrace) {
  //       return Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Icon(
  //             CupertinoIcons.photo,
  //             size: 40,
  //             color: AppColors.greyDark,
  //           ),
  //           Text(
  //             "Not Uploaded",
  //             style: TextStyle(
  //                 fontSize: getWidth(2, context),
  //                 color: AppColors.primaryDark,
  //                 fontWeight: FontWeight.w700),
  //           )
  //         ],
  //       );
  //     },
  //   );
}

Widget buildLegendItem(Color color, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color, // Color is now part of BoxDecoration
            border: Border.all(
                color: Colors.black), // Optional: border for visibility
          ),
        ),
        const SizedBox(width: 10), // Space between the color box and text
        textC(label),
      ],
    ),
  );
}

Widget getSkeletonLoading() {
  return Builder(
    builder: (context) {
      // final stateLocalData = context.watch<LocalDataCubit>().state;
      // final stateRemoteData = context.watch<RemoteDataCubit>().state;
      // if (stateLocalData is GettingLocalData ||
      //     stateRemoteData is GettingData) {
      return Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 50,
          children: List.generate(10, (index) {
            return Container(
              height: getHeight(20, context),
              width: getWidth(90, context),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
            );
          }));
      // }
      // else {
      //   return Container();
      // }
    },
  );
}

paymentStatusWidget({required PaymentStatus paymentStatus}) {
  Widget paymentStatusReturn;
  switch (paymentStatus) {
    case PaymentStatus.SUCCESS:
      paymentStatusReturn = Image.asset(
        AppAssets.confirmedGif,
        scale: 7,
      );
    case PaymentStatus.FAILED:
      paymentStatusReturn = Image.asset(AppAssets.errorGif);
    case PaymentStatus.REFUNDED || PaymentStatus.PENDING:
      paymentStatusReturn = FadeOutDownBig(
        child: const Center(
            child: Icon(Icons.warning_amber, color: Colors.orange, size: 120)),
      );
  }
  return SizedBox(
    height: 200,
    width: double.infinity,
    child: paymentStatusReturn,
  );
}

appCustomBar(String text, context, {Function()? onTap}) {
  return AppBar(
    toolbarHeight: getHeight(10, context),
    centerTitle: true,
    title: textC(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: AppFontSize.s16),
    ),
    leading: Padding(
      padding: const EdgeInsets.all(15),
      child: appBackButton(context, margin: EdgeInsets.zero, onTap: onTap),
    ),
    leadingWidth: 100,
  );
}

appCustomCancelBar(String text, context, {Function()? onTap}) {
  return AppBar(
    toolbarHeight: getHeight(10, context),
    centerTitle: true,
    title: textC(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: AppFontSize.s16),
    ),
    leading: Padding(
      padding: const EdgeInsets.all(15),
      child: appCancelButton(context, margin: EdgeInsets.zero, onTap: onTap),
    ),
    leadingWidth: 100,
  );
}

appSliverCustomCancelBar(String text, context,
    {Function()? onTap, double? paddingSize = 50}) {
  return SliverAppBar(
    toolbarHeight: getHeight(10, context),
    pinned: true,
    expandedHeight: 250,
    flexibleSpace: FlexibleSpaceBar(
      title: fadedText(
          context: context,
          text: text,
          textColor: AppColors.primaryLight,
          paddingSize: const EdgeInsets.only(bottom: 10),
          fontWeight: FontWeight.w600,
          fontSize: 18),
      centerTitle: true,
      background: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingSize!, vertical: paddingSize + 20),
        child: appLogoPreview(context: context),
      ),
    ),
    leading: Padding(
      padding: const EdgeInsets.all(15),
      child: appCancelButton(context, margin: EdgeInsets.zero, onTap: onTap),
    ),
    leadingWidth: 100,
  );
}

sendAppNotification(
    {required String title,
    required String message,
    required NotificationsType notificationsType}) async {
  if (checkNotificationButtonToggleStatus(
      ToggleButtonModel(notificationsType.name, true))) {
    return await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 10,
      largeIcon: AppAssets.appLogo,
      channelKey: 'basic_channel',
      actionType: ActionType.Default,
      title: getLocaleText(title),
      body: getLocaleText(message),
    ));
  }
}

EdgeInsets appCustomPadding(
    {required double horizontal, required double vertical, required context}) {
  return EdgeInsets.fromLTRB(horizontal, vertical, horizontal,
      isKeyboardOpen(context) ? vertical + getHeight(30, context) : vertical);
}

Future<void> fromImageSavePDF(Uint8List screenShot) async {
  final widgets.Document pdf = widgets.Document();

  // Add page with the image
  final image = widgets.MemoryImage(screenShot);
  pdf.addPage(
    widgets.Page(
      pageFormat: PdfPageFormat.roll80,
      build: (context) {
        return widgets.Center(
          child: widgets.Image(image),
        );
      },
    ),
  );

  // Get directory for storing files
  final Directory? directory = await getExternalStorageDirectory();
  if (directory == null) {
    return;
  }

  // Save the PDF to the specified path
  final String path = '${directory.path}/LKE Group_booking.pdf';
  final File file = File(path);
  try {
    final Uint8List pdfBytes = await pdf.save();
    await file.writeAsBytes(pdfBytes);
    shareFile(path);
  } catch (error) {
    rethrow;
  }
}

Text textC(
  String text, {
  String preText = '',
  String postText = '',
  Key? key,
  TextStyle? style,
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  TextScaler? textScaler,
  int? maxLines,
  Color? selectionColor,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior,
}) {
  // Process the text once
  String processedText = "$preText${getLocaleText(text)}$postText";

  // Return the Text widget with the processed text
  return Text(
    processedText,
    key: key,
    style: style,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaler: textScaler,
    maxLines: maxLines,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
  );
}

void printC(message, {bool isError = false}) {
  if (!kReleaseMode) {
    if (isError) {
      // print("ERRORS RECORDED BY APP C PRINT");
      // print(
      //     "----------------------------------------------------------------------------------------------------------------");
      print(message.toString());
      // throw Exception(message);

      // print(
      //     "----------------------------------------------------------------------------------------------------------------");
    }
    // print("NORMAL Print");
    // print("::::::::::::::::::::::::::::::::::::::::::::::::::::::");
    print(message.toString());
    // print("::::::::::::::::::::::::::::::::::::::::::::::::::::::");
  }
}

void shareFile(
  path,
) async {
  try {
    await Share.shareXFiles([XFile(path)]);
  } catch (e) {
    rethrow;
  }
}
