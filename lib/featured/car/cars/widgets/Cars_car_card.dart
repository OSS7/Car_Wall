import 'package:flutter/material.dart';

import 'cars_car_card/cars_car_card_car_info.dart';
import 'cars_car_card/cars_car_card_custom_card.dart';
import 'cars_car_card/cars_car_card_image.dart';
import 'cars_car_card/cars_car_card_top_bar.dart';

class CarsCarCard extends StatelessWidget {
  const CarsCarCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (i, context) {
        return CarsCarCardCustomCard(
          // height: 5,
          child: Column(
            children: [
              const Stack(
                children: [
                  CarsCarCardImage(),
                  CarsCarCardTopBar(),
                ],
              ),
              const CarsCarCardCarInfo(),
            ],
          ),
        );
      },
    );
  }
}
