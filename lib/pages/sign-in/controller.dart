import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talky/model/user_model.dart';
import 'package:talky/pages/sign-in/state.dart';
import 'package:talky/routes/name.dart';
import 'package:talky/user-store.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: const []);

class SignInController extends GetxController {
  final state = SignInState();
  SignInController();

  final db = FirebaseFirestore.instance;

  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();

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
        UserStore.to.saveProfile(userGoogleLogin);
        print('Ok');
        Get.offAndToNamed(AppRoutes.APPLICATION);
      }

    } catch (e) {
      print(e.toString());
    }
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
