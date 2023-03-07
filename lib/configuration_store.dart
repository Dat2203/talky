import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talky/constant/share_prefs_key.dart';
import 'package:talky/storage_service.dart';

class ConfigurationStore extends GetxController{
  static ConfigurationStore get to => Get.find();
  bool isFirstOpen = false;
  final _isLightTheme = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isFirstOpen=  StorageService.to.getBool(STORAGE_IS_FIRST_OPEN);
    _isLightTheme.value = StorageService.to.getBool(STORAGE_IS_LIGHT_THEME) ?? false;
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  Future<void> saveAlreadyOpen() async{
      StorageService.to.setBool(STORAGE_IS_FIRST_OPEN, true);
  }

  Future<void> changeTheme(bool isLigtTheme) async{
    _isLightTheme.value = isLigtTheme;
    StorageService.to.setBool(STORAGE_IS_LIGHT_THEME, isLigtTheme);
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}