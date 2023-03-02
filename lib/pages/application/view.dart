import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talky/pages/Gellary.dart';
import 'package:talky/pages/WebviewScreen.dart';
import 'package:talky/pages/camera.dart';
import 'package:talky/pages/contact/index.dart';
import 'package:talky/pages/location-screen.dart';
import 'package:talky/pages/notification.dart';

import '../Audio.dart';
import 'controller.dart';

class ApplicationPage extends GetView<ApplicationController> {
     ApplicationPage({Key? key}):super(key: key);

  Widget _buildPageView(){
    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.handlePageChange,
      children: [
        Center(child: Text("chat"),),
        Center(child: WebviewScreen()),
        Center(child: LocationScreen()),
      ],
    );
  }
  
  Widget _buildBottomPageView(){
    return  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: controller.handleNavbarTap,
         showSelectedLabels: true,
        items: controller.bottomTabs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomPageView(),
    );
  }
}
