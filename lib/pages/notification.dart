import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:talky/main.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      print(" A new message on running appp");
      RemoteNotification notification = remoteMessage.notification!;
      AndroidNotification androidNotification = notification.android!;
      if(notification != null && androidNotification != null){
        flutterLocalNotificationsPlugin.show(notification.hashCode, notification.body, notification.body, NotificationDetails(
          android: AndroidNotificationDetails(
            androidNotificationChannel.id,
            androidNotificationChannel.name,

          ),
        ));
      }

    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      print(" A new message on foreground");
      RemoteNotification notification = remoteMessage.notification!;
      AndroidNotification androidNotification = notification.android!;
      if( notification != null && androidNotification != null){
        showDialog(context: context, builder: (_){
          return AlertDialog(
            title: Text(notification.title ?? "nothong"),
          );

        });
      }

    });

  }

  void showNotification(){

    flutterLocalNotificationsPlugin.show(0, "ok", "ok", NotificationDetails(
      android: AndroidNotificationDetails(
        androidNotificationChannel.id,
        androidNotificationChannel.name,

      ),
    ));
  }





  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
       onPressed: () { showNotification(); },
       child: Text("show")),
    );
  }
}
