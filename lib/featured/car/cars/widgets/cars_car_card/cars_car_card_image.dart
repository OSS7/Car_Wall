import 'package:flutter/material.dart';

class CarsCarCardImage extends StatelessWidget {
  const CarsCarCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.2,
      // color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/images/car.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
