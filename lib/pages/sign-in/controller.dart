import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stream_chat/stream_chat.dart' as streamchat;
import 'package:talky/model/user_model.dart';
import 'package:talky/pages/sign-in/state.dart';
import 'package:talky/routes/name.dart';
import 'package:talky/streamchat_option.dart';
import 'package:talky/user_store.dart';

import '../../streamchat_option.dart';

GoogleSignIn googleSignIn = GoogleSignIn(scopes: const []);

class SignInController extends GetxController {
  final state = SignInState();
  SignInController();
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final client = StreamChat.clinet;
  Rx<String> verifyId = ''.obs;

  Future<void> handleSignIn() async {
    try {
      var user = await googleSignIn.signIn();

      if (user != null) {
        final GoogleSignInAuthentication googleAuth = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";

        UserGoogleLogin userGoogleLogin = UserGoogleLogin();

        userGoogleLogin.photoUrl = photoUrl;
        userGoogleLogin.email = email;
        userGoogleLogin.displayName = displayName;
        userGoogleLogin.accessToken = id;

        var userbase = await db
            .collection("users")
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userdata, options) =>
                  userdata.toFirestore(),
            )
            .where("id", isEqualTo: id)
            .get();

        if (userbase.docs.isEmpty) {
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photoUrl: photoUrl,
              location: "",
              fcmtoken: '',
              createAt: Timestamp.now());

          await db
              .collection("users")
              .withConverter(
                  fromFirestore: UserData.fromFirestore,
                  toFirestore: (UserData userdata, options) =>
                      userdata.toFirestore())
              .add(data);
        }

         await client.connectUser(
            streamchat.User(id: user.id,image: photoUrl,name: displayName), client.devToken(user.id).rawValue).then((value) => print("connect stream chat succes@"));

        UserStore.to.saveProfile(userGoogleLogin);
        Get.offAndToNamed(AppRoutes.APPLICATION);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> handleSiginWithPhone(String phoneNum) async {
    await _auth.setSettings(appVerificationDisabledForTesting: false);
    _auth
        .verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("-->fail: ${e}");
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verifyId.value = verificationId;
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    )
        .catchError((error) {
      print("err --> ${error}");
    });
    Get.toNamed(AppRoutes.OTP_VERIFY);
  }

  Future verifyOTP(String otp) async {
    try {
      var credential = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: this.verifyId.value, smsCode: otp));
      if (credential.user != null) {
        Get.offAndToNamed(AppRoutes.APPLICATION);
      }
    } catch (e) {}
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("no user signin");
      } else {
        print("user is login in ");
      }
    });
  }
}
