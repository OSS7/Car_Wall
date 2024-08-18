import 'package:carwall/core/constant/colors.dart';
import 'package:carwall/featured/car/cars/widgets/cars_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'bloc/car_bloc.dart';

class CarsView extends StatefulWidget {
  const CarsView({super.key});

  @override
  State<CarsView> createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocConsumer<CarBloc, CarState>(
        bloc: carsBloc..add(GetCarsEvent()),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: cWhite,
            body: CarsBody(state: state),
          );
        },
        listener: (BuildContext context, CarState state) {},
      ),
    );
  }
}
