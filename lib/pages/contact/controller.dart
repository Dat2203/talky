
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
import '../../user_store.dart';






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


  Future<String?> getFcmToken()async{
    String? fcmKey = await FirebaseMessaging.instance.getToken();

    return fcmKey;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    asyncLoadData();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("screen is init");

  }
}
