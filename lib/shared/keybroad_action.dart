import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ActionBar extends StatefulWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  __ActionBarState createState() => __ActionBarState();
}

class __ActionBarState extends State<ActionBar> {
  final StreamMessageInputController controller =
  StreamMessageInputController();

  Timer? _debounce;

  Future<void> _sendMessage() async {
    if (controller.text.isNotEmpty) {
      StreamChannel.of(context).channel.sendMessage(controller.message);
      controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child:  Container(
          padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
          color: Colors.black.withOpacity(0.95),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20, ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  constraints: BoxConstraints(
                      minHeight: 30.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.h)),
                    color: Color.fromRGBO(51, 51, 51, 1).withOpacity(0.95),
                  ),
                  child: TextField(
                    controller: controller.textFieldController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Aa",
                      border: InputBorder.none,
                    ),
                    minLines: 1,
                    maxLines: 5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 24.0,
                ),
                child:ElevatedButton(
                  onPressed: _sendMessage, child: Icon(Icons.send_rounded),
                ),
              )
            ],
          ),
        ),
    );
  }
}