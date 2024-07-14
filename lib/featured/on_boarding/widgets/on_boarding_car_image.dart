import 'package:flutter/material.dart';

class OnBoardingCarImage extends StatelessWidget {
  const OnBoardingCarImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Transform(
      alignment: Alignment.centerLeft, // Adjust alignment as needed
      transform: Matrix4.translationValues(-(size.width * 0.1), 0.0, 0.0),
      child: const Image(
        image: AssetImage('assets/images/car.png'),
      ),
    );
  }
}
