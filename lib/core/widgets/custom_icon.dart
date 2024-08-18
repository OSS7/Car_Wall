import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final double? size;
  final String icon;
  const CustomIcon(
    this.icon, {
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size ?? 30,
      width: size ?? 30,
    );
  }
}
