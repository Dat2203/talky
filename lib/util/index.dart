import 'package:stream_chat/stream_chat.dart';
import 'package:talky/model/message.dart';
import 'package:talky/model/user_model.dart';

class Utils {
  //chunk list message into revicer and sender
  static List<List<MessageModel>> chunkList(List<MessageModel> messages) {
    List<MessageModel> cloneList = messages;
    List<List<MessageModel>> chunkList = [];
    List<MessageModel> chunk = [];
    for (int i = 0; i < cloneList.length ; i++) {
      if (i == 0) {
        chunk.add(cloneList[0]);
      } else if (cloneList[i].senderId == cloneList[i - 1].senderId) {
        chunk.add(cloneList[i]);
      } else if(cloneList[i].senderId != cloneList[i - 1].senderId) {
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
    String id = '101991853508428205227';

    if (channel.state?.members.isNotEmpty ?? false) {
      final otherMembers = channel.state?.members
          .where(
            (element) => element.userId !=  id,
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
    String id = '101991853508428205227';
    if (channel.image != null) {
      return channel.image!;
    } else if (channel.state?.members.isNotEmpty ?? false) {
      final otherMembers = channel.state?.members
          .where(
            (element) => element.userId != id,
      )
          .toList();

      if (otherMembers?.length == 1) {

        return  otherMembers!.first.user?.image;
      }
    }
    return null;
  }
}

// (chunkList[i-1]!=null && cloneList[i].senderId != cloneList[i-1].senderId)
