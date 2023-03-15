import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talky/pages/wellcome/controller.dart';

import 'controller.dart';

class ProfilePage extends GetView<ProfileController>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text("Profile"),

      ) ,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          child: Text("log out"),
          onPressed: (){
            Get.defaultDialog(
              title: "Are you want to logout",
              content: Container(),
              onConfirm: (){
                controller.logOut();
              }

            );

          },
        ),
      ),
    );
  }
}