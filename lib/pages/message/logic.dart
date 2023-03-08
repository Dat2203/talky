import 'package:get/get.dart';
import 'package:talky/routes/name.dart';

import 'state.dart';

class MessageLogic extends GetxController {
  final MessageState state = MessageState();

  void handleOpenChatBox(String userId){
      Get.toNamed(AppRoutes.CHATBOX);
  }
}
