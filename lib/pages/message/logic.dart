import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:talky/routes/name.dart';
import 'package:talky/user_store.dart';

import '../../streamchat_option.dart';
import 'state.dart';

class MessageLogic extends GetxController {
  final MessageState state = MessageState();
  final _auth = FirebaseAuth.instance;
  late Future<List<Channel>> channelQuerry;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    channelQuerry = StreamChat.clinet.queryChannels(
      state: true,
      filter: Filter.and([
        Filter.in_('members',['101991853508428205227'])
      ]),
    ).last;
  }
  @override
  void onReady() {
    // TODO: implement onReady

  }


  void handleOpenChatBox(String userId){
      Get.toNamed(AppRoutes.CHATBOX);
  }
}
