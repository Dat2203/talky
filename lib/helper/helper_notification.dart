import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HelperNotification {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInit = new AndroidInitializationSettings('mipmap/pngegg');
    var initializationSettings =  new InitializationSettings(android: androidInit);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,  badge: true,sound: true
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      print("reviced remote massage");
      print(message.notification?.title);
      HelperNotification.showBigTextNotification(title: message.notification?.title ?? "No title", body: message.notification?.body ?? "No title", fln: flutterLocalNotificationsPlugin);
    });

  }

  static Future showBigTextNotification(
      {int id = 0,
      required String title,
      required String body,
      payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("talky", "channel_name",
            playSound: true,
            importance: Importance.max,
            priority: Priority.high);

    var  noti = NotificationDetails(android: androidNotificationDetails);

    await fln.show( 0, title, body, noti);
  }
}
