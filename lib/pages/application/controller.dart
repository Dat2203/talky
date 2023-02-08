import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class ApplicationController extends GetxController {
  final ApplicationState state = ApplicationState();

  late final List<String> tabTitles;
  late final PageController  pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tabTitles =["Chat","Contact","Account"];
    bottomTabs =[
      BottomNavigationBarItem(icon: Icon(Icons.message),label: "Chat"),
      BottomNavigationBarItem(icon: Icon(Icons.message),label: "Contact"),
      BottomNavigationBarItem(icon: Icon(Icons.message),label: "Acount"),
    ];

    pageController = PageController(initialPage: state.pageIndex);
  }

  handlePageChange(int index){
    state.pageIndex= index;
  }

  handleNavbarTap(int index){
    pageController.jumpToPage(index);

  }

}
