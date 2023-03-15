import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:talky/shared/message_item.dart';

import '../model/message.dart';

class ListMesssage extends StatefulWidget {
  final List<MessageModel> messages;
  const ListMesssage({Key? key, required this.messages}) : super(key: key);

  @override
  State<ListMesssage> createState() => _ListMesssageState();
}

class _ListMesssageState extends State<ListMesssage> {
  @override
  Widget build(BuildContext context) {
    bool isSender = widget.messages[0].senderId == "0";
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
                  child: CircleAvatar(
                    radius: 12.w, // Image radius
                    backgroundImage: NetworkImage(
                        'https://phantom-marca.unidadeditorial.es/38d327959012f4d1955e77a9a34d5d2c/resize/660/f/webp/assets/multimedia/imagenes/2023/01/12/16735402991293.jpg'),
                  ),
                ),
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: ClampingScrollPhysics(),
                itemCount: widget.messages.length,
                itemBuilder: (context, index) => MessageItem(
                    content: widget.messages[index].content!,
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
