import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:talky/shared/avatar_circle.dart';
import 'package:talky/shared/message_item.dart';
import 'package:talky/user_store.dart';

import '../model/message.dart';

class ListMesssage extends StatefulWidget {
  final List<Message> messages;
  const ListMesssage({Key? key, required this.messages}) : super(key: key);

  @override
  State<ListMesssage> createState() => _ListMesssageState();
}

class _ListMesssageState extends State<ListMesssage> {
  @override
  Widget build(BuildContext context) {

    final currentUser = UserStore.to.profile;
    bool isSender = widget.messages[0].user?.id  == currentUser.accessToken;
    int length = widget.messages.length;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isSender
              ? Container()
              : Container(
                  margin: EdgeInsets.only(right: 10),
                  child: AvatarCircleCachedNetwork(
                    size: 12.w,
                    photoUrl: widget.messages[0].user?.image,
                  )
                ),
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: ClampingScrollPhysics(),
                itemCount: widget.messages.length,
                itemBuilder: (context, index) => MessageItem(
                    content: widget.messages[index].text ?? " ",
                    isSender: isSender,
                    isFirst: index == 0,
                    isLast: index == length - 1,
                    hasMidle: length > 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
