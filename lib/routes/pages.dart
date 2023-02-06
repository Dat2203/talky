import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:talky/pages/sign-in/index.dart';
import 'package:talky/pages/wellcome/binding.dart';

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
    ),
    GetPage(name: AppRoutes.SIGN_IN, page:()=> SignInPage())

    // GetPage
  ];
}
