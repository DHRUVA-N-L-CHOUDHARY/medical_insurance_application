import 'package:get/get.dart';
import 'package:medical_insurance_system/app/modules/add_record/bindings/add_record_binding.dart';
import 'package:medical_insurance_system/app/modules/home/views/home_view.dart';
import 'package:medical_insurance_system/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:medical_insurance_system/app/modules/sign_in/views/sign_in_screen.dart';
import 'package:medical_insurance_system/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:medical_insurance_system/app/modules/sign_up/views/sign_up_screen.dart';

import '../modules/add_record/views/add_record_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const SIGNIN = Routes.SIGNIN;
  static const SIGNUP = Routes.SIGNUP;
  static const DASHBOARD = Routes.DASHBOARD;
  static const SEARCH = Routes.SEARCH;
  static const CHECKOUT = Routes.CHECKOUT;
  static const SPLASH = Routes.SPLASH;
  static const HOME = Routes.HOME;
  static const ADDRECORD = Routes.ADDRECORD;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADDRECORD,
      page: () => const AddRecordView(),
      binding: AddRecordBinding(),
    ),
  ];
}
