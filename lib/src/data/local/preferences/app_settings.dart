import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_coded/src/domain/usecases/notification_usecase.dart';

import '../../../core/utils/managers/app_lists.dart';

ScrollPhysics getAppHomePageScrollPhysics() {
  bool isToggled =
      checkSettingsButtonToggleStatus(AppLists.appSettingsButtonsItemLists[0]);
  if (isToggled) {
    return const AlwaysScrollableScrollPhysics();
  } else {
    return const NeverScrollableScrollPhysics();
  }
}
