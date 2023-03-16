import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:talky/constant/env.dart';
import 'package:talky/routes/name.dart';
import 'package:talky/util/index.dart';

class ChatItem extends StatefulWidget {
  final Channel channel;
  const ChatItem({Key? key, required this.channel}) : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.CHATBOX);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: ListTile(
          leading: Stack(
            children: [
              Positioned(
                  child: CircleAvatar(
                radius: 27, // Image radius
                backgroundImage: NetworkImage(Utils.getChannelImage(widget.channel) ?? DEFAULT_EMPTY_AVATAR_URL),
              )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.black)
                  ) ,
              ))

            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Utils.getChannelName(widget.channel),style: Get.textTheme.bodyText1),
              SizedBox(height: 10.h,),
              _buildLastMessage(widget.channel),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLastMessage(Channel channel) {
    return StreamBuilder<int>(
      stream: channel.state!.unreadCountStream,
      initialData: channel.state?.unreadCount ?? 0,
      builder: (context, count) {
        return StreamBuilder<Message?>(
          stream: channel.state!.lastMessageStream,
          initialData: channel.state!.lastMessage,
          builder: (context, lastMessage) {
            if(lastMessage.hasData){
              return Text(
                lastMessage.data?.text ?? "",
                overflow: TextOverflow.ellipsis,
                style: (count.data! > 0)
                    ? const TextStyle(
                  fontSize: 12,
                )
                    : const TextStyle(
                  fontSize: 12,
                ),
              );
            }

            return Container();
          },
        );
      },
    );
  }
}
