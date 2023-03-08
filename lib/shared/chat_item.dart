import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:talky/routes/name.dart';

class ChatItem extends StatefulWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.CHATBOX);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: ListTile(
          leading: Stack(
            children: [
              Positioned(
                  child: CircleAvatar(
                radius: 27, // Image radius
                backgroundImage: NetworkImage('https://phantom-marca.unidadeditorial.es/38d327959012f4d1955e77a9a34d5d2c/resize/660/f/webp/assets/multimedia/imagenes/2023/01/12/16735402991293.jpg'),
              )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.black)
                  ) ,
              ))

            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Robert Downey Jr",style: Get.textTheme.bodyText1),
              SizedBox(height: 10.h,),
              Text("This is new mesage", style: Get.textTheme.bodySmall,),

            ],
          ),
        ),
      ),
    );
  }
}
