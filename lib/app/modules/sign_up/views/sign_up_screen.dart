import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_insurance_system/app/data/remote/endpoints.dart';
import 'package:medical_insurance_system/utils/colors.dart';
import '../../../components/elevatedbutton.dart';
import '../../../components/text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: controller.isLoading.value
                ? CircularProgressIndicator()
                : Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Logo.jpg',
                            width: 150,
                            height: 150,
                            filterQuality: FilterQuality.high,
                          ),
                          Text(
                            "Let's register you ",
                            style: TextStyle(
                              fontSize: 30,
                              color: controller.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Let's register your account with below given information",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 4),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/user.png",
                                      width: 15,
                                      height: 15,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "User Type",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: kWhiteColor,
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: DropdownButton<String>(
                                    underline: Container(
                                      color: Colors.transparent,
                                    ),
                                    value: controller.selectedUserType.value,
                                    hint: Text(
                                      'Select User Type',
                                      style: TextStyle(color: Colors.grey[400]),
                                    ),
                                    onChanged: (String? newValue) {
                                      controller.setSelectedUserType(
                                          newValue ?? controller.userTypes[0]);
                                    },
                                    isExpanded: true,
                                    items: controller.userTypes
                                        .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MyTextField(
                            textController: controller.nameController,
                            firstImage: 'assets/user.png',
                            firstText: 'Name',
                            hintText: controller.selectedUserType.value ==
                                    controller.userTypes[0]
                                ? 'Enter Your Name'
                                : controller.selectedUserType.value ==
                                        controller.userTypes[1]
                                    ? "Enter Hospital Name"
                                    : "Enter Insurance Company Name",
                            isPassword: false,
                          ),
                          MyTextField(
                            textController: controller.phoneController,
                            firstImage: 'assets/telephone.png',
                            firstText: 'Phone Number',
                            hintText: 'Enter Your Phone Number',
                            keyboardType: TextInputType.number,
                            textInputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10)
                            ],
                            isPassword: false,
                          ),
                          MyTextField(
                            textController: controller.emailController,
                            firstImage: 'assets/email.png',
                            firstText: 'Email Id',
                            hintText: 'enter your Email Id',
                            keyboardType: TextInputType.emailAddress,
                            isPassword: false,
                          ),
                          controller.selectedUserType.value ==
                                  controller.userTypes[0]
                              ? MyTextField(
                                  textController:
                                      controller.aadharNumberController,
                                  firstImage: 'assets/aadhar.png',
                                  firstText: 'Aadhar Number',
                                  hintText: 'Enter Your Aadhar Number',
                                  keyboardType: TextInputType.number,
                                  textInputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(12)
                                  ],
                                  isPassword: false,
                                )
                              : MyTextField(
                                  textController:
                                      controller.aadharNumberController,
                                  firstImage: 'assets/aadhar.png',
                                  firstText: 'Hospital ID',
                                  hintText: 'Enter Hospital ID',
                                  keyboardType: TextInputType.text,
                                  isPassword: false,
                                ),
                          MyTextField(
                            textController: controller.passwordController,
                            firstImage: 'assets/padlock.png',
                            firstText: 'Password',
                            hintText: 'enter your Password',
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                          ),
                          MyButton(
                            ontap: () {
                              if (controller.selectedUserType.value ==
                                  controller.userTypes[0]) {
                                controller.signUp({
                                  "email": controller.emailController.text,
                                  "password":
                                      controller.passwordController.text,
                                  "name": controller.nameController.text,
                                  "phone": controller.phoneController.text,
                                  "aadhaar":
                                      controller.aadharNumberController.text
                                }, Endpoints.user);
                              } else if (controller.selectedUserType.value ==
                                  controller.userTypes[1]) {
                                controller.signUp({
                                  "email": controller.emailController.text,
                                  "password":
                                      controller.passwordController.text,
                                  "name": controller.nameController.text,
                                  "phone": controller.phoneController.text,
                                  "license":
                                      controller.aadharNumberController.text
                                }, Endpoints.hospital);
                              } else {
                                controller.signUp({
                                  "email": controller.emailController.text,
                                  "password":
                                      controller.passwordController.text,
                                  "name": controller.nameController.text,
                                  "phone": controller.phoneController.text,
                                  "policies":[]
                                }, Endpoints.insurance);
                              }
                            },
                            text: 'Register',
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?'),
                              GestureDetector(
                                onTap: () => {
                                  Get.toNamed(AppPages.SIGNIN),
                                },
                                child: Text('Login here',
                                    style: TextStyle(
                                      color: controller.textColor,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
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
