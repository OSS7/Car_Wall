import 'package:carwall/featured/car/cars/models/car_model.dart';
import 'package:flutter/material.dart';

class CarDetailsDetailsSectionCarName extends StatelessWidget {
  final CarModel? car;
  const CarDetailsDetailsSectionCarName({super.key, this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            car?.name ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            textAlign: TextAlign.left,
          ),
          Row(
            children: [
              Text(
                car?.rate.toString() ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
              )
            ],
          ),
        ],
      ),
    );
  }
}
