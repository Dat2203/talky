import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talky/routes/name.dart';
import 'package:talky/user_store.dart';

import '../sign-in/controller.dart';
import 'state.dart';

class ProfileController extends GetxController {
  final ProfileState state = ProfileState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.MESSAGE);
    });
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      await UserStore.to.logOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
