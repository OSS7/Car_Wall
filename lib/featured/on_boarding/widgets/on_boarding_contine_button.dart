import 'package:carwall/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class OnBoardingContinueButton extends StatelessWidget {
  const OnBoardingContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.09,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: cWhite,
        onPressed: () {
          Get.toNamed(MyRoutes.CARS);
        },
        child: Text(
          'Continue to the app',
          style: TextStyle(
            color: cPrimary,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
