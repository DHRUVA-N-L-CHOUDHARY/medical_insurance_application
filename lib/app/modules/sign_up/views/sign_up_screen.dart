import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
            body: controller.isLoading.value ? CircularProgressIndicator() : Center(
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
                    MyTextField(
                      textController: controller.nameController,
                      firstImage: 'assets/user.png',
                      firstText: 'Name',
                      hintText: 'Enter Your Name',
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
                    MyTextField(
                      textController: controller.aadharNumberController,
                      firstImage: 'assets/aadhar.png',
                      firstText: 'Aadhar Number',
                      hintText: 'Enter Your Aadhar Number',
                      keyboardType: TextInputType.number,
                      textInputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(12)
                      ],
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
                        controller.signUp();
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
