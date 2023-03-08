import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talky/shared/chat_item.dart';

import 'logic.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MessageLogic>();
    final state = Get.find<MessageLogic>().state;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      "Message",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                // ListView.builder(
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => ChatItem(),
                ),
              ],
            ),
          )
    );
  }
}
