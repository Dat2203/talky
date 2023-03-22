import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:talky/configuration_store.dart';
import 'package:talky/constant/share_prefs_key.dart';
import 'package:talky/model/user_model.dart';
import 'package:talky/routes/name.dart';
import 'package:talky/storage_service.dart';
import 'package:talky/streamchat_option.dart';
import 'package:stream_chat/stream_chat.dart' as streamchat;

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  final clinet = StreamChat.clinet;
  final _isLogin = false.obs;
  final _profile = UserGoogleLogin().obs;

  String token = '';

  bool get isLogin => _isLogin.value;
  UserGoogleLogin get profile => _profile.value;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOnline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);

    if (profileOnline != '') {
      var userGoogleLoginStorage = jsonDecode(profileOnline);

      _profile.value = UserGoogleLogin(
          accessToken: userGoogleLoginStorage["accessToken"],
          photoUrl: userGoogleLoginStorage["photoUrl"],
          displayName: userGoogleLoginStorage["displayName"]);

      StreamChat.clinet.connectUser(
          streamchat.User(
            id: userGoogleLoginStorage["accessToken"],
          ),
          StreamChat.clinet
              .devToken(userGoogleLoginStorage["accessToken"])
              .rawValue);
    }

    _isLogin.value = profileOnline != '';
  }

  Future<void> saveProfile(UserGoogleLogin userGoogleLogin) async {
    _isLogin.value = true;
    var value = jsonEncode(userGoogleLogin);
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, value);
    _profile.value = userGoogleLogin;
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  Future<void> logOut() async {
    _isLogin.value = false;
    try {
      StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
      await clinet.disconnectUser();
      Get.offAllNamed(AppRoutes.SIGN_IN);
    } catch (e) {
      print(e.toString());
    }
  }
}
