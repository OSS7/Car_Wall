import 'package:carwall/featured/car/cars/models/car_model.dart';
import 'package:flutter/material.dart';

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
                style: TextStyle(fontSize: 24),
              ),
              Row(
                children: [
                  Text(car.rate.toString()),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          width: 200,
          child: Divider(
            height: 4,
            thickness: 2,
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
                '\$${car.price}',
                style: TextStyle(
                    fontSize: 26,
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
