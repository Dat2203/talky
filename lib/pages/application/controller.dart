import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class ApplicationController extends GetxController {
  final ApplicationState state = ApplicationState();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;
  late final List<AppBar> appBars;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tabTitles = ["Chat", "Contact", "Account"];
    bottomTabs = [
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_2_fill,size: 15,),
          activeIcon:Icon(CupertinoIcons.chat_bubble_2_fill,color: Colors.blue,size: 15) ,
          label: "Chat",
          backgroundColor: Colors.blue),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bell_fill,size: 15),
          activeIcon:Icon(CupertinoIcons.bell_fill,color: Colors.blue,size: 15) ,
          label: "Contact",
          backgroundColor: Colors.blue),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person_2_fill,size: 15),
          activeIcon:Icon(CupertinoIcons.person_2_fill,color: Colors.blue,size: 15) ,
          label: "Acount",
          backgroundColor: Colors.blue),
    ];


    pageController = PageController(initialPage: state.pageIndex);
  }

  int get pageIndex => state.pageIndex;

  handlePageChange(int index) {
    state.pageIndex = index;
  }

  handleNavbarTap(int index) {
    pageController.jumpToPage(index);
  }
}
