import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:talky/shared/avatar_circle.dart';
import 'package:talky/shared/keybroad_action.dart';
import 'package:talky/shared/list_message.dart';
import 'package:talky/util/index.dart';
import '../../model/message.dart';
import '../../shared/connection_status_builder.dart';
import 'controller.dart';

class ChatPage extends GetView<ChatController> {
  Channel channel = Get.arguments;

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 60.h,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 3.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.purpleAccent,
                  )),
              Stack(
                children: [
                  Positioned(
                      child: AvatarCircleCachedNetwork(
                    photoUrl: Utils.getChannelImage(channel),
                    size: 15,
                  )),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.green[600],
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.black)),
                      ))
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Utils.getChannelName(channel),
                      style: Get.textTheme.bodyText1),
                  SizedBox(
                    height: 2.h,
                  ),
                  BetterStreamBuilder(
                    stream: controller.channel.state!.membersStream,
                    initialData: channel.state!.members,
                    builder: (context, data) {
                      return ConnectionStatusBuilder(
                        statusBuilder: (context, status) {
                          print(status);
                          switch (status) {
                            case ConnectionStatus.connected:
                              return Text("Ok");
                            case ConnectionStatus.connecting:
                              return const Text(
                                'Connecting',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              );
                            case ConnectionStatus.disconnected:
                              return const Text(
                                'Offline',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              );
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
              color: Colors.purpleAccent,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_camera_back_rounded,
              color: Colors.purpleAccent,
            ))
      ],
      actionsIconTheme: IconThemeData(size: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamChannel(
      channel: channel,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                 child: MessageListCore(
                    loadingBuilder: (BuildContext context) {
                      return Container();
                    },
                    emptyBuilder: (BuildContext context) {
                      return const SizedBox.shrink();
                    },
                    messageListBuilder: (context, List<Message> messages) {
                      var chunk = Utils.chunkList(messages);
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: chunk.length,
                            itemBuilder: (context, index) =>
                                ListMesssage(messages: chunk[index])),
                      );
                    },
                    errorBuilder: (BuildContext context, Object error) {
                      return Text("Error");
                    },
                  ),
                ),
                Align(alignment: Alignment.bottomLeft, child: ActionBar()),
              ],
            )),
      ),
    );
  }

  Widget _buildConnectedTitleState(
    BuildContext context,
    List<Member>? members,
  ) {
    Widget? alternativeWidget;
    final channel = StreamChannel.of(context).channel;
    final memberCount = channel.memberCount;
    if (memberCount != null && memberCount > 2) {
      var text = 'Members: $memberCount';
      final watcherCount = channel.state?.watcherCount ?? 0;
      if (watcherCount > 0) {
        text = 'watchers $watcherCount';
      }
      alternativeWidget = Text(
        text,
      );
    } else {
      final userId = StreamChatCore.of(context).currentUser?.id;
      final otherMember = members?.firstWhereOrNull(
        (element) => element.userId != userId,
      );

      if (otherMember != null) {
        if (otherMember.user?.online == true) {
          alternativeWidget = const Text(
            'Online',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          );
        } else {
          alternativeWidget = Text(
            'Last online: '
            '${Jiffy(otherMember.user?.lastActive).fromNow()}',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          );
        }
      }
    }

    return Container();
  }
}
// class _MessageList extends StatelessWidget {
//   const _MessageList({
//     Key? key,
//     required this.messages,
//   }) : super(key: key);
//
//   final List<Message> messages;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListView.separated(
//         itemCount: messages.length + 1,
//         reverse: true,
//         separatorBuilder: (context, index) {
//           if (index == messages.length - 1) {
//             return _DateLable(dateTime: messages[index].createdAt);
//           }
//           if (messages.length == 1) {
//             return const SizedBox.shrink();
//           } else if (index >= messages.length - 1) {
//             return const SizedBox.shrink();
//           } else if (index <= messages.length) {
//             final message = messages[index];
//             final nextMessage = messages[index + 1];
//             if (!Jiffy(message.createdAt.toLocal())
//                 .isSame(nextMessage.createdAt.toLocal(), Units.DAY)) {
//               return _DateLable(
//                 dateTime: message.createdAt,
//               );
//             } else {
//               return const SizedBox.shrink();
//             }
//           } else {
//             return const SizedBox.shrink();
//           }
//         },
//         itemBuilder: (context, index) {
//           if (index < messages.length) {
//             final message = messages[index];
//             if (message.user?.id == context.currentUser?.id) {
//               return _MessageOwnTile(message: message);
//             } else {
//               return _MessageTile(message: message);
//             }
//           } else {
//             return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }
// }
