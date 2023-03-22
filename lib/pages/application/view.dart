import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talky/pages/Gellary.dart';
import 'package:talky/pages/camera.dart';
import 'package:talky/pages/contact/index.dart';
import 'package:talky/pages/location-screen.dart';
import 'package:talky/pages/message/view.dart';
import 'package:talky/pages/notification.dart';
import 'package:talky/shared/keep_alive_wrapper.dart';

import '../Audio.dart';
import 'controller.dart';

final appBars = [
  AppBar(
    title: Text("Message") ,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  AppBar(title: Text("Contact"), backgroundColor: Colors.transparent),
  AppBar(title: Text("Setting"), backgroundColor: Colors.transparent),
];

class ApplicationPage extends GetView<ApplicationController> {
  ApplicationPage({Key? key}) : super(key: key);

  Widget _buildPageView() {
    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.handlePageChange,
      children: [
        Center(
          child: KeepAliveWrapper(child: MessagePage(),),
        ),
        Center(child: Center()),
        Center(child: LocationScreen()),
      ],
    );
  }

  Widget _buildBottomPageView() {
    return SizedBox(
      height: 50.h,
      child: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: controller.handleNavbarTap,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: controller.state.pageIndex,
          items: controller.bottomTabs),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBars[controller.state.pageIndex],
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomPageView(),
      ),
    );
  }
}
