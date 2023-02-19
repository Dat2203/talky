import 'package:get/get.dart';
import 'package:talky/pages/contact/controller.dart';


class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>ContactController());
  }
}
