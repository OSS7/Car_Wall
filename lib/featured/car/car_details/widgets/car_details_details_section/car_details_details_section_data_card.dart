import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_icon.dart';

class CarDetailsDetailsSectionDataCard extends StatelessWidget {
  final String icon;
  final String? text;
  const CarDetailsDetailsSectionDataCard(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.12,
      width: size.width * 0.25,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(icon),
            Text(
              text ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
