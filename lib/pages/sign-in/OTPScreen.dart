import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'controller.dart';

class OTPScreen extends GetView<SignInController> {

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: OTPTextField(
            length: 6,
            width: MediaQuery.of(context).size.width*0.8,
            fieldWidth: 20,

            style: TextStyle(
                fontSize: 17
            ),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  otp = pin;
                  // controller.verifyOTP(otp);
                }
            ),
          )
        ],
      ),
    ));
  }
}
