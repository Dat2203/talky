import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ChatPage extends GetView<ChatController> {

  _buildAppBar(){
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 60.h,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3.h,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed:(){
                Get.back();
              }, icon:  Icon(Icons.arrow_back_ios,color: Colors.purpleAccent,))
              ,
              Stack(
                children: [
                  Positioned(
                      child: CircleAvatar(
                        radius: 15, // Image radius
                        backgroundImage: NetworkImage(
                            'https://phantom-marca.unidadeditorial.es/38d327959012f4d1955e77a9a34d5d2c/resize/660/f/webp/assets/multimedia/imagenes/2023/01/12/16735402991293.jpg'),
                      )),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.green[600],
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.black)),
                      ))
                ],
              ),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Robert Downey Jr",style: Get.textTheme.bodyText1),
                  SizedBox(height: 2.h,),
                  Text("Active", style: Get.textTheme.bodySmall,),

                ],
              ),

            ],

          ),
        ),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.phone,color: Colors.purpleAccent,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.video_camera_back_rounded,color: Colors.purpleAccent,))
      ],
      actionsIconTheme: IconThemeData(
          size: 25
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(),
          body: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: 14,
                    itemBuilder: (context, index) =>Container(
                      padding: EdgeInsets.symmetric(vertical: 7,horizontal: 5),
                      margin:  EdgeInsets.symmetric(vertical: 20),
                      constraints: BoxConstraints(
                        minHeight: 30.h,
                        maxWidth: 150.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.h)),
                        color: Color.fromRGBO(51, 51, 51, 1).withOpacity(0.95),
                      ),
                      child: Text("dádadda ${index}",style: Get.textTheme.bodyText1,),
                    ) ,)
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.95),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Icons.add, color: Colors.white, size: 20, ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          constraints: BoxConstraints(
                            minHeight: 30.h
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.h)),
                            color: Color.fromRGBO(51, 51, 51, 1).withOpacity(0.95),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "Aa",
                              border: InputBorder.none,
                            ),
                            minLines: 1,
                            maxLines: 5,
                          ),
                        ),
                      ),
                      // FloatingActionButton(
                      //   onPressed: (){},
                      //   child: Icon(Icons.send,color: Colors.white,size: 18,),
                      //   backgroundColor: Colors.blue,
                      //   elevation: 0,
                      // ),
                    ],

                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}
