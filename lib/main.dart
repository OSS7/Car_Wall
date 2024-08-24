import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/config/injectable_cofig.dart';
import 'core/config/route_config.dart' as my_route;
import 'core/constant/routes.dart';
import 'featured/on_boarding/on_boarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: my_route.getPages,
        initialRoute: MyRoutes.HOME,
        home: const OnBoardingView(),
      ),
    );
  }
}
