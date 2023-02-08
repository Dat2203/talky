import 'dart:convert';

import 'package:get/get.dart';
import 'package:talky/configuration_store.dart';
import 'package:talky/constant/share_prefs_key.dart';
import 'package:talky/model/user_model.dart';
import 'package:talky/storage_service.dart';

class UserStore extends GetxController{
  static UserStore get to=> Get.find();

  final _isLogin = false.obs;
  final _profile = UserGoogleLogin().obs;

  String token ='';

  bool get isLogin => _isLogin.value;
  UserGoogleLogin get profile =>_profile.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    token =StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOnline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  Future<void> saveProfile(UserGoogleLogin userGoogleLogin)async{
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_TOKEN_KEY, jsonEncode(userGoogleLogin));
  }

  Future<void> setToken(String value) async{
      await StorageService.to.setString(STORAGE_USER_TOKEN_KEY,value);
      token =value;
  }
}