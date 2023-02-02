import 'package:get/get.dart';
import 'package:talky/pages/wellcome/controller.dart';

class WellcomeBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WellcomeController>(() => WellcomeController());
  }
}