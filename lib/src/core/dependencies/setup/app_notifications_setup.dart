import 'package:awesome_notifications/awesome_notifications.dart';

import '../../../presentation/Shared/widgets_builder.dart';
import '../../utils/managers/app_enums.dart';
import '../../themes/styles/app_colors.dart';

class AppNotificationSetup {
  static init() async {
//     await FirebaseMessaging.instance.setAutoInitEnabled(true);

//     final notificationSettings =
//         await FirebaseMessaging.instance.requestPermission(provisional: true);
// // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
//     final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//     if (apnsToken != null) {
//       // APNS token is available, make FCM plugin API requests...
//     }

    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: AppColors.primaryColor,
              ledColor: AppColors.white)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);
    await AppNotificationSetup.setListener();
  }

  static setListener() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: AppNotificationSetup.onActionReceivedMethod,
        onNotificationCreatedMethod:
            AppNotificationSetup.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            AppNotificationSetup.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            AppNotificationSetup.onDismissActionReceivedMethod);
  }

  requestPermission() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
      //Welcome Message
    });
    sendAppNotification(
        title: 'Welcome to LKE Group!',
        message: "Thank you for installing our app",
        notificationsType: NotificationsType.Welcome_Message);
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Nothing (later add action)
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Nothing (later add action)
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // nothing
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Nothing (later add action)
    //
    // // Navigate into pages, avoiding to open the notification details page over another details page already opened
    // MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil('/notification-page',
    //         (route) => (route.settings.name != '/notification-page') || route.isFirst,
    //     arguments: receivedAction);
  }
}
