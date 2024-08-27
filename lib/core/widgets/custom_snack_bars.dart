import 'package:carwall/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///class that provide dialog, snackbars and toast so will be like a notification
///used to inform the user about the action that he did.
/// for example:
/// when login or when added new cars.
class CustomSnackBar {
  static showCustomSnackBar(
      {required String title, required String message, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ??
          const Duration(
            seconds: 5,
          ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      colorText: cWhite,
      backgroundColor: cGreen,
      icon: Icon(
        Icons.check_circle,
        color: cWhite,
      ),
    );
  }

  static showCustomErrorSnackBar(
      {required String title,
      required String message,
      Color? color,
      IconData? icon,
      Duration? duration}) {
    Get.snackbar(
      title,
      message,
      titleText: SizedBox(
          height: 26,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: cWhite),
          )),
      messageText: Center(
          child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, color: cWhite),
      )),
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: cWhite,
      barBlur: 5,
      backgroundColor: cRed,
      icon: Icon(
        icon ?? Icons.error,
        color: cWhite,
      ),
    );
  }

  static showCustomToast(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.rawSnackbar(
      padding: const EdgeInsets.all(10),
      title: title,
      duration: duration ?? const Duration(seconds: 6),
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: color ?? cGreen,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      message: message,
    );
  }

  static showCustomErrorToast(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? cRed,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }
}
