
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:talky/model/user_model.dart';
import 'package:talky/pages/contact/state.dart';
import 'package:talky/routes/name.dart';
import '../../main.dart';
import '../../model/push_notification.dart';
import '../../shared/bandage.dart';
import '../../user-store.dart';






class ContactController extends GetxController {
  ContactController();

  final state = ContactState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;
  final Rx<PushNotification> _notificationInfor = PushNotification(body: '',title: '').obs;

  asyncLoadAllData() async {
    var contactBase = await db
        .collection("users")
        .where("id", isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userdata, options) => userdata.toFirestore())
        .get();

    for (var doc in contactBase.docs) {
      state.contactList.add(doc.data());
    }
  }

  handleOpenChat(UserData to_user) async {
    // await db.collection("message").withConverter(fromFirestore: , toFirestore: toFirestore)
  }

  asyncLoadData() async {
    print('run in here 1');

    var userbase = await db
        .collection("users")
        .where('id', isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userdData, options) {
              return userdData.toFirestore();
            })
        .get();

    // userbase.docs.forEach((element) {
    //   state.contactList.add(element.data());
    // });
  }

  void dsa()async{
    print('run in here');

    FirebaseMessaging  messaging = FirebaseMessaging.instance;
    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(" message--->  ");
        print( message.notification?.title ?? "null");
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        print("init notification");
        _notificationInfor.value = notification;
      });

      if (_notificationInfor != null) {
        // For displaying the notification as an overlay
        showSimpleNotification(
          Text( _notificationInfor.value.title ?? "") as Widget,
          leading: NotificationBadge(totalNotifications: 1),
          subtitle: Text(_notificationInfor.value.body ?? "") as Widget,
          background: Colors.cyan.shade700,
          duration: Duration(seconds: 2),
        );
      }else{
        print("erros");
      }
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<String?> getFcmToken()async{
    String? fcmKey = await FirebaseMessaging.instance.getToken();

    return fcmKey;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    asyncLoadData();
    dsa();
    print("screen is ready");
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("screen is init");

  }
}
