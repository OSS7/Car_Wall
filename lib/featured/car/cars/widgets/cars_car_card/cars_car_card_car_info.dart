import 'package:carwall/featured/car/cars/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var formatter = NumberFormat('#,###,###');

class CarsCarCardCarInfo extends StatelessWidget {
  final CarModel car;
  const CarsCarCardCarInfo({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.white30,
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                car.name,
                style: const TextStyle(fontSize: 22),
              ),
              Row(
                children: [
                  Text(car.rate.toString()),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: SizedBox(
            width: double.infinity,
            child: Divider(
              height: 4,
              thickness: 2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                car.type,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                '\$${formatter.format(car.price)}',
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
