import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class SignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late String email;
  late String password;
  late RxBool rememberMe = false.obs;
  late Color textColor = const Color(0xFF3463B4);
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void setRemeberState(bool value) {
    rememberMe = value.obs;
    update();
  }

  Future<void> loginCustomer(String username, String password) async {
    isLoading(true);
    update();
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      Map<String, dynamic> data = {"email": username, "password": password};

      Map res = await ApiService().loginUser(data);
      print(res);
      if (res["status"] == 1) {
        MySharedPref.setEmail(res["userData"]["email"].toString());
        MySharedPref.setUserId(res["userData"]["_id"].toString());
        MySharedPref.setName(res["userData"]["name"].toString());
        MySharedPref.setPhone(res["userData"]["phone"].toString());
        MySharedPref.setAadhar(res["userData"]["aadhar"].toString());
        Get.snackbar(
          'Message',
          "Login Successful",
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10.0,
          margin: const EdgeInsets.all(10.0),
          isDismissible: true,
          duration: const Duration(seconds: 3),
        );
        Timer(const Duration(seconds: 2), () {
          Get.offAllNamed(AppPages.HOME);
        });
      } else {
        Get.snackbar(
          'Error',
          res["message"],
          backgroundColor: Colors.red,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10.0,
          margin: const EdgeInsets.all(10.0),
          isDismissible: true,
          duration: const Duration(seconds: 3),
        );
      }
    isLoading(false);
    update();
    } catch (e) {
      rethrow;
    }
  }
}
