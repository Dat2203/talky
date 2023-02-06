import 'package:get/get.dart';
import 'controller.dart';

class SignInBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignInController>(() => SignInController());

  }
}