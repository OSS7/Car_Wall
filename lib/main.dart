import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/config/route_config.dart' as my_route;
import 'core/constant/routes.dart';
import 'featured/car/cars/bloc/car_bloc.dart';
import 'featured/on_boarding/on_boarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CarBloc()),
      ],
      child: GetMaterialApp(
        getPages: my_route.getPages,
        initialRoute: MyRoutes.HOME,
        home: const OnBoardingView(),
      ),
    );
  }
}
