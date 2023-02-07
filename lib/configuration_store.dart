import 'package:get/get.dart';
import 'package:talky/constant/share_prefs_key.dart';
import 'package:talky/storage_service.dart';

class ConfigurationStore extends GetxController{
  static ConfigurationStore get to => Get.find();
  bool isFirstOpen = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isFirstOpen=  StorageService.to.getBool(STORAGE_IS_FIRST_OPEN);
  }

  Future<void> saveAlreadyOpen() async{
      StorageService.to.setBool(STORAGE_IS_FIRST_OPEN, true);
  }
}