import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_insurance_system/utils/colors.dart';

import '../controllers/add_record_controller.dart';

class AddRecordView extends StatelessWidget {
  const AddRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddRecordController>(
        init: AddRecordController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: const BottomAppBar(
              color: kPrimaryBlue,
            ),
          );
        });
  }
}
