import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:talky/shared/chat_item.dart';

import 'logic.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessageLogic>();
    final state = Get.find<MessageLogic>().state;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                      ),
                      hintText: "Search",
                    ),
                  ),
                ),

            FutureBuilder<List<Channel>>(
                future: controller.channelQuerry,
                builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return const Center(
                    child: Text(
                      'So empty.\nGo and message someone.',
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) => ChatItem(
                    channel: snapshot.data![index],
                  ),);
              },)


              ],
            ),
          )
    );
  }
}
