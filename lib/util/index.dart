import 'package:flutter/cupertino.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:talky/model/message.dart';
import 'package:talky/model/user_model.dart';
import 'package:talky/user_store.dart';

class Utils {

  //chunk list message into revicer and sender
  static List<List<Message>> chunkList(List<Message> messages) {
    List<Message>cloneList = messages;
    List<List<Message>> chunkList = [];
    List<Message> chunk = [];


    for (int i = 0; i < cloneList.length ; i++) {
      if (i == 0) {
        chunk.add(cloneList[0]);
      } else if (cloneList[i].user?.id == cloneList[i - 1].user?.id) {
        chunk.add(cloneList[i]);
      } else if(cloneList[i].user?.id != cloneList[i - 1].user?.id) {
        chunkList.add(chunk);
        chunk = [cloneList[i]];
      }
    }
    if(chunk.length>0){
      chunkList.add(chunk);
    }

    return chunkList;
  }


  static String getChannelName(Channel channel) {
    final currentUser = UserStore.to.profile;

    if (channel.state?.members.isNotEmpty ?? false) {
      final otherMembers = channel.state?.members
          .where(
            (element) => element.userId !=  currentUser.accessToken!,
      )
          .toList();

      if (otherMembers?.length == 1) {
        return otherMembers!.first.user?.name ?? 'No name';
      } else {
        return 'Multiple users';
      }
    } else {
      return 'No Channel Name';
    }
  }

  static String? getChannelImage(Channel channel) {
    final currentUser = UserStore.to.profile;
    if (channel.state?.members.isNotEmpty ?? false) {
      final otherMembers = channel.state?.members
          .where(
            (element) => element.userId != currentUser.accessToken,
      )
          .toList();

      if (otherMembers?.length == 1) {

        return  otherMembers!.first.user?.image;
      }
    }
    return null;
  }

  static Alignment convertOffset( Offset offset, bool isSendMessage){
    double widthScreen = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    double heightScreen  = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

    double alignmentY = (offset.dy - heightScreen/2)/(heightScreen/2);

    return Alignment( isSendMessage ? 1 : -1, alignmentY-0.15);


  }
}

// (chunkList[i-1]!=null && cloneList[i].senderId != cloneList[i-1].senderId)
