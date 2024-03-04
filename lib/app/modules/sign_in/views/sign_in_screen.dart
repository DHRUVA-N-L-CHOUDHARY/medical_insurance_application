import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../components/elevatedbutton.dart';
import '../../../components/text_field.dart';
import '../../../data/remote/endpoints.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
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
                          "Let's sign you in ",
                          style: TextStyle(
                            fontSize: 30,
                            color: controller.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Sign in with your data that you have entered during your registration',
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
                          textController: controller.emailController,
                          firstImage: 'assets/email.png',
                          firstText: 'Email Id',
                          hintText: 'enter your Email Id',
                          isPassword: false,
                        ),
                        MyTextField(
                          textController: controller.passwordController,
                          firstImage: 'assets/padlock.png',
                          firstText: 'Password',
                          hintText: 'enter your Password',
                          isPassword: true,
                        ),
                        MyButton(
                          ontap: () {
                            if(controller.selectedUserType.value == controller.userTypes[0])
                            {
                            controller.login(
                                controller.emailController.text,
                                controller.passwordController.text,Endpoints.user);
                            }
                            else if(controller.selectedUserType.value == controller.userTypes[1])
                            {
                              controller.login(
                                controller.emailController.text,
                                controller.passwordController.text,Endpoints.hospital);
                            }
                            else
                            {
                               controller.login(
                                controller.emailController.text,
                                controller.passwordController.text,Endpoints.insurance);
                            }
                          },
                          text: 'Sign In',
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account? '),
                            GestureDetector(
                              onTap: () => {Get.toNamed(AppPages.SIGNUP)},
                              child: Text(
                                'Register Now',
                                style: TextStyle(
                                  color: controller.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
