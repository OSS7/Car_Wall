import 'package:carwall/featured/car/cars/bloc/car_bloc.dart';
import 'package:carwall/featured/car/cars/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/routes.dart';
import 'cars_car_card/cars_car_card_car_info.dart';
import 'cars_car_card/cars_car_card_custom_card.dart';
import 'cars_car_card/cars_car_card_image.dart';
import 'cars_car_card/cars_car_card_top_bar.dart';

class CarsCarCard extends StatelessWidget {
  const CarsCarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carsBloc.cars.length,
      itemBuilder: (context, i) {
        CarModel _car = carsBloc.cars[i];
        return CarsCarCardCustomCard(
          onPress: () {
            Get.toNamed(MyRoutes.CAR_DETAILS, arguments: _car.name);
          },
          child: Column(
            children: [
              Stack(
                children: [
                  CarsCarCardImage(image: _car.image),
                  const CarsCarCardTopBar(),
                ],
              ),
              CarsCarCardCarInfo(
                car: _car,
              ),
            ],
          ),
        );
      },
    );
  }
}
