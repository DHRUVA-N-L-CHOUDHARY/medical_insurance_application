import 'package:get/get.dart';
import 'package:medical_insurance_system/app/data/local/my_shared_pref.dart';
import 'package:medical_insurance_system/app/routes/app_service.dart';

class SplashController extends GetxController {
  RxBool validation = false.obs;

  @override
  void onInit() async {
    super.onInit();
    validation.value = await AppService.isValidString(MySharedPref.getUserId());
    print(validation.value);
    update();
  }
}
