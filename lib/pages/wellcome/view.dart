import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:talky/pages/wellcome/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellcomePage extends GetView<WellcomeController> {
  const WellcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>
         Center(
            child: SizedBox(
          width: 360.w,
          height: 780.w,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                onPageChanged: (index) {
                  controller.changedPageView(index);
                },
                controller: PageController(
                  initialPage: 0,
                  keepPage: false,
                  viewportFraction: 1,
                ),
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.red
                        // image: DecorationImage(
                        //   fit: BoxFit.fill,
                        //   image:AssetImage('assets/banner_started_image.svg'),
                        // ),
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.cyan
                        // image: DecorationImage(
                        //   fit: BoxFit.fill,
                        //   image:AssetImage('assets/banner_started_image.svg'),
                        // ),
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.red
                        // image: DecorationImage(
                        //   fit: BoxFit.fill,
                        //   image:AssetImage('assets/banner_started_image.svg'),
                        // ),
                        ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.handleSignIn();
                              },
                              child: null,
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  side: MaterialStateProperty.all(
                                      const BorderSide(color: Colors.white))),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 70,
                  child: DotsIndicator(
                    dotsCount: 3,
                    reversed: false,
                    mainAxisAlignment: MainAxisAlignment.center,
                    position: controller.state.index.toDouble(),
                    decorator: DotsDecorator(
                      size:Size.square(6),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      activeSize: Size(18, 9)
                    ),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
