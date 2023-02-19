import 'package:get/get.dart';

import '../contact/controller.dart';
import 'controller.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(()=>ContactController());
  }
}
