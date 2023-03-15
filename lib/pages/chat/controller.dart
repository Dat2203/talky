import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:talky/streamchat_option.dart';
import 'state.dart';

class ChatController extends GetxController {
  final ChatState state = ChatState();
  final _auth = FirebaseAuth.instance;
  late Stream<List<Channel>> channelQuerry;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    channelQuerry = StreamChat.clinet.queryChannels(
      state: true,
      filter: Filter.and([
        Filter.in_("members", [_auth.currentUser?.uid! as Object])
      ]),
    );
  }




}