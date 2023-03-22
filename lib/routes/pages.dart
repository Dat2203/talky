import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:talky/middleware/route-rwellcome.dart';
import 'package:talky/pages/application/binding.dart';
import 'package:talky/pages/chat/binding.dart';
import 'package:talky/pages/chat/view.dart';
import 'package:talky/pages/profile/binding.dart';
import 'package:talky/pages/sign-in/OTPScreen.dart';
import 'package:talky/pages/sign-in/index.dart';
import 'package:talky/pages/sign-in/signin-phonenumber.dart';
import 'package:talky/pages/wellcome/binding.dart';
import '../pages/application/view.dart';
import '../pages/profile/view.dart';
import '../pages/wellcome/view.dart';
import 'name.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;

  static const APPlication = AppRoutes.APPLICATION;
  // static final RouteObserver<Route> observer = RouteObservers ():
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WellcomePage(),
      binding: WellcomeBinding(),
      curve: Curves.bounceIn,
      transition: Transition.fade,
      middlewares: [RouteWellComeMiddleWare(priority: 1)]
    ),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => SignInPage(),
        binding: SignInBinding()),

    GetPage(
        name: AppRoutes.APPLICATION,
        page: () => ApplicationPage(),
        binding: ApplicationBinding()),

    GetPage(
        name: AppRoutes.OTPSIGNIN,
        page: () => OTPVerifyPage(),
        binding: SignInBinding()),
    GetPage(
        name: AppRoutes.OTP_VERIFY,
        page: () => OTPScreen(),
        binding: SignInBinding()),

    GetPage(
        name: AppRoutes.CHATBOX,
        page: () => ChatPage(),
        binding: ChatBinding()),
    GetPage(
        name: AppRoutes.ME,
        transition: Transition.leftToRight,
        page: () => ProfilePage(),
        binding: ProfileBinding()),


    // GetPage
  ];
}
