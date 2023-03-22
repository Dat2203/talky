import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:talky/configuration_store.dart';
import 'package:talky/constant/env.dart';
import 'package:talky/firebase_options.dart';
import 'package:talky/routes/pages.dart';
import 'package:talky/storage_service.dart';
import 'package:talky/theme.dart';
import 'package:talky/user_store.dart';
import 'helper/helper_notification.dart';
import 'package:talky/streamchat_option.dart' as StreamChatCustom;

Future firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

late final cameras;

void main() async {
  final client = StreamChatClient(
    streamApiKey,
    logLevel: Level.INFO,
  );
  WidgetsFlutterBinding.ensureInitialized();
  //
  // await JustAudioBackground.init(
  //   androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
  //   androidNotificationChannelName: 'Audio playback',
  //   androidNotificationOngoing: true,
  // );

  //
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigurationStore>(ConfigurationStore());
  Get.put<UserStore>(UserStore());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();

  try {
    if (GetPlatform.isMobile) {
      final RemoteMessage? remoteMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      if (remoteMessage != null) {}
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      HelperNotification.initialize(flutterLocalNotificationsPlugin);
    }
  } catch (e) {}
  ;



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: (context, child) => StreamChatCore(client: StreamChatCustom.StreamChat.clinet, child: child!),
          
        ),
      ),
    );
  }
}
