import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../constant/routes.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(MyRoutes.CARS);
            },
            child: Text(
              'Home',
              style: _style,
            ),
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              Get.toNamed(MyRoutes.SERVICES);
            },
            child: Text(
              'Services',
              style: _style,
            ),
          ),
          const Divider(),
          TextButton(
            onPressed: () {},
            child: Text(
              'Profile',
              style: _style,
            ),
          ),
          const Divider(),
          TextButton(
            onPressed: () {
              Get.toNamed(MyRoutes.ON_BOARDING);

            },
            child: Text(
              'OnBoarding',
              style: _style,
            ),
          ),
        ],
      ),
    );
  }

  final TextStyle _style =
      TextStyle(color: cPrimary, fontSize: 14, fontWeight: FontWeight.bold);
}
