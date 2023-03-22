import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:talky/streamchat_option.dart';
import 'state.dart';

class ChatController extends GetxController {
  final ChatState state = ChatState();
  late final Channel channel ;


  @override
  void onInit() {
    super.onInit();
    channel = Get.arguments;
  }

  Future<void> _unreadCountHandler(int count) async {
    if (count > 0) {

    }
  }
}