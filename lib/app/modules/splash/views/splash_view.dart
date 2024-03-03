import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.r),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/icons/Logo.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 8.0).h,
                            child: Text(
                              "Welcome to Lorem Ipsum",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.sp),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0.r),
                            child: Text(
                              "Automated Medical Insurance System",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black54),
                            ),
                          ),
                        ),
                        controller.validation.value == false
                            ? Center(
                                child: Card(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.r,
                                      horizontal: Get.width / 16),
                                  color: kWhiteColor,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: kSecondaryBlue,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(25.r)),
                                 
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.offAllNamed(AppPages.SIGNUP);
                                        },
                                        child: Container(
                                          width: 2 * Get.width / 5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25.r),
                                            color: kPrimaryBlue,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(Get.width / 50),
                                            child: Center(
                                              child: Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                    color: kWhiteColor,
                                                    fontSize: 20.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.offAllNamed(AppPages.SIGNIN);
                                        },
                                        child: SizedBox(
                                          width: 2 * Get.width / 5,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(Get.width / 50),
                                            child: Center(
                                              child: Text(
                                                "Sign In",
                                                style:
                                                    TextStyle(fontSize: 20.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Card(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: Get.width / 16),
                                color: kWhiteColor,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: kSecondaryBlue,
                                  ),
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                child: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.offAllNamed(AppPages.HOME);
                                    },
                                    child: Container(
                                      width: 3 * Get.width / 5,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                        color: kPrimaryBlue,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(Get.width / 50),
                                        child: Center(
                                          child: Text(
                                            "Start",
                                            style: TextStyle(
                                                color: kWhiteColor,
                                                fontSize: 20.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
