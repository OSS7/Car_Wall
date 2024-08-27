import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomButton extends StatelessWidget {
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Function() onPress;
  final String title;
  final double? height;
  const CustomButton(
      {super.key,
      this.foregroundColor,
      this.backgroundColor,
      required this.onPress,
      required this.title,
      this.height});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width * 0.9,
      height: height ?? size.height * 0.07,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        disabledColor: backgroundColor ?? cWhite,
        color: backgroundColor ?? cWhite,
        highlightColor: backgroundColor ?? cWhite,
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(
            color: foregroundColor ?? cPrimary,
            fontSize: 20,
          ),
        ),
      ),
    );
    ;
  }
}
