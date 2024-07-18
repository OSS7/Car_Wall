import 'package:carwall/core/constant/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/Cars_car_card.dart';
import 'widgets/cars_filter_bar.dart';
import 'widgets/cars_search_bar.dart';
import 'widgets/cars_top_bar.dart';

class CarsView extends StatelessWidget {
  const CarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: const Column(
        children: [
          CarsTopBar(),
          CarsSearchBar(),
          CarsFilterBar(),
          Expanded(
            child: CarsCarCard(),
          ),
        ],
      ),
    );
  }
}
