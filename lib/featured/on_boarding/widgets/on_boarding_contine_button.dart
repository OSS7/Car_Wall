import 'package:carwall/core/constant/routes.dart';
import 'package:carwall/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingContinueButton extends StatelessWidget {
  const OnBoardingContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onPress: () {
          Get.toNamed(MyRoutes.LOGIN);
        },
        title: 'Continue to the app');
  }
}
