import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MessageItem extends StatefulWidget {
  final bool isSender;
  final bool isFirst;
  final bool hasMidle;
  final bool? isLast;
  const MessageItem(
      {Key? key,
      required this.isSender,
      required this.isFirst,
      required this.hasMidle,
      this.isLast})
      : super(key: key);

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 250,
        minWidth: 50
      ),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        borderRadius: widget.hasMidle
            ? _setBorder(
                widget.isSender, widget.isFirst, widget.isLast ?? false)
            : BorderRadius.all(Radius.circular(15.h)),
        color: widget.isSender
            ? Colors.blue
            : Color.fromRGBO(51, 51, 51, 1).withOpacity(0.95),
      ),
      child: Text(
        "dấdads",
        style: Get.textTheme.bodyText1,
      ),
    );
  }

  BorderRadius _setBorder(bool isSender, bool isFirst, bool isLast) {
    if (isSender && isFirst) {
      return BorderRadius.only(
          topLeft: Radius.circular(15.h),
          bottomLeft: Radius.circular(15.h),
          bottomRight: Radius.circular(15.h),
          topRight: Radius.circular(5.h));
    }
    if (isSender && isLast) {
      return BorderRadius.only(
          topLeft: Radius.circular(15.h),
          bottomLeft: Radius.circular(15.h),
          topRight: Radius.circular(15.h),
          bottomRight: Radius.circular(5.h));
    }
    return BorderRadius.all(Radius.circular(15.h));
  }
}
