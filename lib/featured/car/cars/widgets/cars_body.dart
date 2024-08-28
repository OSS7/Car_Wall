import 'package:flutter/material.dart';

import '../bloc/car_bloc.dart';
import 'Cars_car_card.dart';
import 'cars_filter_bar.dart';
import 'cars_search_bar.dart';
import 'cars_top_bar.dart';

class CarsBody extends StatelessWidget {
  final CarState state;
  const CarsBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CarsTopBar(),
        const CarsSearchBar(),
        const CarsFilterBar(),
        Expanded(
          child: (state is CarsDoneState)
              ? const CarsCarCard()
              : (state is CarsErrorState)
                  ? const Text('state.message')
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ],
    );
  }
}
