import 'package:flutter_clean_coded/src/core/utils/managers/app_lists.dart';

class ToggleButtonModel {
  final String name;
  bool isToggled;

  ToggleButtonModel(this.name, this.isToggled);
}

bool checkNotificationButtonToggleStatus(ToggleButtonModel notification) {
  return AppLists.notificationButtonsItemLists
      .any((item) => item.name == notification.name && item.isToggled == true);
}

bool checkSettingsButtonToggleStatus(ToggleButtonModel setting) {
  return AppLists.appSettingsButtonsItemLists.any((item) {
    return item.name == setting.name && item.isToggled == true;
  });
}
