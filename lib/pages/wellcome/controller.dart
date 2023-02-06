import 'package:get/get.dart';
import 'package:talky/pages/wellcome/state.dart';
import 'package:talky/routes/name.dart';

class WellcomeController extends GetxController{
  final state = WellcomeState();
  WellcomeController();

  changedPageView(int index) async {
      state.index.value = index;
  }

  handleSignIn(){
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

}