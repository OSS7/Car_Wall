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
                style: TextStyle(fontSize: 22),
              ),
              Row(
                children: [
                  Text(car.rate.toString()),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: const SizedBox(
            width: double.infinity,
            child: Divider(
              height: 4,
              thickness: 2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                car.type,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '\$${formatter.format(car.price)}',
                style: TextStyle(
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
