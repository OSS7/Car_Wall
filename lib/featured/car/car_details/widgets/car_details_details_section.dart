import '../../../../core/constant/icons.dart';
import '../../cars/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'car_details_details_section/car_details_details_section_car_name.dart';
import 'car_details_details_section/car_details_details_section_data_card.dart';
import 'car_details_details_section/car_details_details_section_map.dart';

var formatter = NumberFormat('#,###,###');

class CarDetailsDetailsSection extends StatelessWidget {
  final CarModel? car;
  const CarDetailsDetailsSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          CarDetailsDetailsSectionCarName(car: car),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CarDetailsDetailsSectionDataCard(
                icon: MyIcons.DOLLAR,
                text: '\$${formatter.format(car?.price)}',
              ),
              CarDetailsDetailsSectionDataCard(
                icon: MyIcons.MANUAL,
                text: car?.type.toString(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CarDetailsDetailsSectionDataCard(
                icon: MyIcons.SPEED,
                text: '${car?.mileage.toString()} Mi',
              ),
              CarDetailsDetailsSectionDataCard(
                icon: MyIcons.CALENDER,
                text: car?.year.toString(),
              ),
              CarDetailsDetailsSectionDataCard(
                icon: MyIcons.LOCATION,
                text: car?.location.toString(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const CarDetailsDetailsSectionMap(),
        ],
      ),
    );
  }
}
