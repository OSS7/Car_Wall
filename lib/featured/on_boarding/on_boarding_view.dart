import 'package:carwall/core/constant/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/on_boarding_car_image.dart';
import 'widgets/on_boarding_contine_button.dart';
import 'widgets/on_boarding_top_text.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OnBoardingTopText(),
            OnBoardingCarImage(),
            OnBoardingContinueButton(),
          ],
        ),
      ),
    );
  }
}
