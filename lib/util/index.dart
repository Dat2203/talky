import 'package:talky/model/message.dart';

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
}

// (chunkList[i-1]!=null && cloneList[i].senderId != cloneList[i-1].senderId)
