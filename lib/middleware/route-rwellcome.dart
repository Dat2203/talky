import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:talky/configuration_store.dart';
import 'package:talky/routes/name.dart';
import 'package:talky/user_store.dart';

import '../user_store.dart';

class RouteWellComeMiddleWare extends GetMiddleware {
  @override
  int? priority = 0;

  RouteWellComeMiddleWare({this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigurationStore.to.isFirstOpen == false) {
      return null;
    }
    if (UserStore.to.isLogin == true) {
      return RouteSettings(name: AppRoutes.APPLICATION);
    } else {
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
