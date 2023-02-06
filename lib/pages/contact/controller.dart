import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:talky/model/user_model.dart';
import 'package:talky/pages/contact/state.dart';
import 'package:talky/routes/name.dart';
import 'package:talky/storage.dart';
import 'package:talky/store.dart';
import 'package:talky/user_store.dart';

class ContactController extends GetxController {
  final state = ContactState();
  ContactController();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;


  handleOpenChat(UserData to_user) async{
    // await db.collection("message").withConverter(fromFirestore: , toFirestore: toFirestore)

  }

  asyncLoadData() async {
    var  userbase = await db.collection("users").where('id', isNotEqualTo: token).withConverter(
        fromFirestore: UserData.fromFireStore,
        toFirestore: (UserData userdData, options) {
          return userdData.toFireStore();
        }).get();

    userbase.docs.forEach((element) {
      state.contactList.add(element.data());
    });
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    asyncLoadData();
  }
}
