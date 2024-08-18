import 'package:carwall/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'bloc/car_bloc.dart';
import 'widgets/Cars_car_card.dart';
import 'widgets/cars_filter_bar.dart';
import 'widgets/cars_search_bar.dart';
import 'widgets/cars_top_bar.dart';

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
            body: Column(
              children: [
                const CarsTopBar(),
                const CarsSearchBar(),
                const CarsFilterBar(),
                Expanded(
                  child: (state is CarsDoneState)
                      ? const CarsCarCard()
                      : (state is CarsErrorState)
                          ? Text(state.message)
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, CarState state) {},
      ),
    );
  }
}
