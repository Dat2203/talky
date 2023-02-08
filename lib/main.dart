import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:talky/configuration_store.dart';
import 'package:talky/firebase_options.dart';
import 'package:talky/routes/pages.dart';
import 'package:talky/storage_service.dart';
import 'package:talky/user-store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<StorageService>(()=>StorageService().init());
  Get.put<ConfigurationStore>(ConfigurationStore());
  Get.put<UserStore>(UserStore());



  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) =>
       GetMaterialApp(
        title: 'Flutter Demo',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}


