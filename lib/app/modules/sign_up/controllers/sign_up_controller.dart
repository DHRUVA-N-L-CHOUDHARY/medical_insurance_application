import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:medical_insurance_system/app/data/remote/endpoints.dart';
import 'package:medical_insurance_system/utils/colors.dart';

import '../../../components/snackBar.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../../utils/common_utils.dart';

class SignUpController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController aadharNumberController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  // late TextEditingController

  RxBool isLoading = false.obs;
  late Color textColor = const Color(0xFF3463B4);

  RxString selectedUserType =
      'Patient'.obs; // Observable for selected user type
  final List<String> userTypes = [
    'Patient',
    'Hospital',
    'Insurance Company'
  ]; // List of user types

  // Function to set selected user type
  void setSelectedUserType(String userType) {
    selectedUserType.value = userType;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    aadharNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  Future<void> signUp(Map<String, dynamic> data, String userType) async {
    isLoading(true);
    update();
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      if (nameController.text.trim().isEmpty) {
        showSnackbar("name");
        return;
      } else if (emailController.text.trim().isEmpty) {
        showSnackbar("email");
        return;
      } else if (phoneController.text.trim().isEmpty) {
        showSnackbar("phone number");
        return;
      } else if (emailController.text.trim().isNotEmpty &&
          !validateEmail(emailController.text.trim())) {
        showSnackbar("valid email");
        return;
      } else if (passwordController.text.trim().isEmpty) {
        showSnackbar("password");
        return;
      } else if (aadharNumberController.text.trim().isEmpty ||
          (aadharNumberController.text.trim().length < 12 && selectedUserType.value == userTypes[0])) {
        showSnackbar("Aaadhar Number");
        return;
      } else if (isPasswordCompliant(
              passwordController.text.trim().toString()) ==
          false) {
        Get.snackbar("Please provide valid Password",
            "Password should have minimum of 1 special Character, 1 Uppercase letter, 1 lowercase letter, 1 digit and minimum length of 8 characters.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        return;
      } else {
        Map res = await ApiService().createUserAccount(data, userType);
        if (res["status"] == 1) {
          if (selectedUserType.value == userTypes[0]) {
            MySharedPref.setEmail(res["data"]["email"].toString());
            MySharedPref.setUserId(res["data"]["_id"].toString());
            MySharedPref.setName(res["data"]["name"].toString());
            MySharedPref.setPhone(res["data"]["phone"].toString());
            MySharedPref.setAadhar(res["data"]["aadhar"].toString());
          } else if (selectedUserType.value == userTypes[1]) {
            MySharedPref.setEmail(res["data"]["email"].toString());
            MySharedPref.setUserId(res["data"]["_id"].toString());
            MySharedPref.setName(res["data"]["name"].toString());
            MySharedPref.setPhone(res["data"]["phone"].toString());
            MySharedPref.setAadhar(res["data"]["license"].toString());
          } else {
            MySharedPref.setEmail(res["data"]["email"].toString());
            MySharedPref.setUserId(res["data"]["_id"].toString());
            MySharedPref.setName(res["data"]["name"].toString());
            MySharedPref.setPhone(res["data"]["phone"].toString());
            MySharedPref.setAadhar(res["data"]["aadhar"].toString());
          }
          Get.snackbar("Register Successfully", "User Successfully Registered",
              backgroundColor: kPrimaryBlue,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
          Get.offAllNamed(AppPages.HOME);
        } else {
          Get.snackbar("Error", res["message"],
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        }
        isLoading(false);
        update();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    aadharNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
