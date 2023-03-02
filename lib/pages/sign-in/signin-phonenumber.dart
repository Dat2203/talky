import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:talky/pages/sign-in/controller.dart';

class OTPVerifyPage extends GetView<SignInController>{
  TextEditingController _textEditingControllerntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _textEditingControllerntroller,

              ),
              ElevatedButton(onPressed: (){
                controller.handleSiginWithPhone(_textEditingControllerntroller.text);
              }, child: Text("Send OTP"))
            ],
          ),
        ),
      ),
    );

  }
  
}