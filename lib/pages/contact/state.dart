import 'package:get/get.dart';
import 'package:talky/model/push_notification.dart';

import '../../model/user_model.dart';

class ContactState {
 Rx<int> _totalNotifications= 0.obs;
 // final _notificationInfor = Rx<PushNotification?>(PushNotific);
 var conut =0.obs;
 RxList<UserData> contactList =<UserData>[].obs;

 int get  totlNotification => _totalNotifications.value;
 // get notificationInfor => _notificationInfor.value;

 set totalNotification(int value)=> _totalNotifications.value =value;
 // set notificationInfor ( PushNotification value)=> _notificationInfor?.value = value;

}
