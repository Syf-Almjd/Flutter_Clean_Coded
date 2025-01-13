import 'package:flutter_clean_coded/src/presentation/modules/authentication/auth_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/managers/app_enums.dart';
import '../../modules/splash/splash_screen.dart';
import '../../shared/components.dart';

part 'navi_state.dart';

class NaviCubit extends Cubit<NaviState> {
  NaviCubit() : super(InitialNaviState());

  static NaviCubit get(context) => BlocProvider.of(context);
  // var appHomeGetIt = AppHomeGetIt();

  navigate(context, Widget widget) async {
    // if (isGuestMode &&
    //     !AppLists.guestModeWidget.contains(widget.runtimeType.toString())) {
    // showChoiceDialog(
    //     context: context,
    //     title: "Sign in required!",
    //     content: "Please sign in to continue",
    //     onYes: () {
    //       navigateToSliderLogout(context);
    //     });
    // return;
    // } else {

    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
    emit(PagePushed(pageName: widget.toString()));
    // }
  }

  // navigateView(PageViewType pageViewType, {bool isAnimated = true}) async {
  //   int animationDuration = isAnimated ? 500 : 10;
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     switch (pageViewType) {
  //       case PageViewType.homePage:
  //         appHomeGetIt.goToHomePageView(0, animationDuration);
  //         break;
  //       case PageViewType.feedbackPage:
  //         appHomeGetIt.goToHomePageView(1, animationDuration);
  //         break;
  //       case PageViewType.myBookingPage:
  //         appHomeGetIt.goToHomePageView(2, animationDuration);
  //         break;
  //       case PageViewType.myPropertyPage:
  //         appHomeGetIt.goToHomePageView(3, animationDuration);
  //         break;
  //       case PageViewType.newsPage:
  //         appHomeGetIt.goToHomePageView(4, animationDuration);
  //         break;
  //       case PageViewType.profilePage:
  //         appHomeGetIt.goToHomePageView(5, animationDuration);
  //         break;
  //       default:
  //         appHomeGetIt.goToHomePageView(0, animationDuration);
  //         break;
  //     }
  //   });
  // }

  navigateReplaced(context, Widget widget) async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => widget,
        transitionDuration: Duration.zero,
      ),
    ).then((_) {
      emit(PagePushed(pageName: widget.toString()));
    });
  }

  void navigateOff(context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
    emit(PagePushedOff(pageName: widget.toString()));
  }

  Future<void> navigateToHome(context) async {
    /// Remove all routes from the stack
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AuthRouter()),
      (route) => false,
    );
    // appHomeGetIt.goToHomePageView(0, 1);

    emit(HomeState());
  }

  void navigateToAdmin(context) {
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const LoginPage()));
    emit(AdminState());
  }

  navigateToSliderLogout(context) async {
    isGuestMode = false;
    // await LocalDataCubit.get(context).clearAllData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
        (route) => false,
      );
    });
    emit(IntoPageState());
  }

  void pop(context) {
    final currentRoute = ModalRoute.of(context);
    // Check if there is a previous route in the navigation stack
    if (currentRoute != null && currentRoute.canPop) {
      Navigator.pop(context);
    }
    emit(PagePopped(pageName: currentRoute.toString()));
  }
}
