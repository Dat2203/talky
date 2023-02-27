import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/push_notification.dart';
import '../../shared/bandage.dart';
import 'controller.dart';

class ContactPage extends StatelessWidget {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final logic = Get.find<ContactController>();
  final state = Get.find<ContactController>().state;



  @override
  Widget build(BuildContext context) {



      return Scaffold(
        appBar: AppBar(
          title: Text('Notify'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'App for capturing Firebase Push Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(onPressed: ()async{
             final String? key =await logic.getFcmToken();
             print("fmckey: "+ key!);

            }, child: Text("push notification")),
            ElevatedButton(onPressed: ()async{
              final String? key =await logic.getFcmToken();
              print("fmckey: "+ key!);

            }, child: Text("Play Audio")),
            NotificationBadge(totalNotifications: state.totlNotification),
            SizedBox(height: 16.0),
            // TODO: add the notification text here
          ],
        ),
      );
    }
}
