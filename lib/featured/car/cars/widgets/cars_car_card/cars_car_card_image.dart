import 'package:flutter/material.dart';

class CarsCarCardImage extends StatelessWidget {
  final String image;
  const CarsCarCardImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.2,
      // color: Colors.white,
      child: Center(
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
