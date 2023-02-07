// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:talky/pages/Contact/controller.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:talky/pages/contact/widgets/contact_list_view.dart';
//
// class ContactPage extends GetView<ContactController> {
//   const ContactPage({Key? key}) : super(key: key);
//
//   Widget _buildAppbar(){
//     return AppBar(
//       title: Text("Contact"),
//       backgroundColor: Colors.cyanAccent,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("contact --> ");
//     print(controller.state.contactList.length);
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Contact")),
//         backgroundColor: Colors.cyanAccent,
//       ),
//       body:Container(
//         child:  ContactList(),
//       ),
//     );
//   }
// }
