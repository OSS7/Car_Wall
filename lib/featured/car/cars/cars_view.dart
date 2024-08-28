import 'package:carwall/core/constant/colors.dart';
import 'package:carwall/featured/car/cars/widgets/cars_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../core/widgets/custom_drawer.dart';
import 'bloc/car_bloc.dart';

class CarsView extends StatefulWidget {
  const CarsView({super.key});

  @override
  State<CarsView> createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  int selectedIndex = 0;
  void _onItemTapped(int i) {
    setState(() {
      selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocBuilder<CarBloc, CarState>(
        bloc: carsBloc..add(GetCarsEvent()),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: cWhite,
            drawer: CustomDrawer(),
            body: CarsBody(
              state: state,
            ),
          );
        },
      ),
    );
  }
}
