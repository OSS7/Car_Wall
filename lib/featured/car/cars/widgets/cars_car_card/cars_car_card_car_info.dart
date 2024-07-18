import 'package:flutter/material.dart';

class CarsCarCardCarInfo extends StatelessWidget {
  const CarsCarCardCarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.white30,
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Audi A8',
                style: TextStyle(fontSize: 24),
              ),
              Row(
                children: [
                  Text('4.5'),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
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
                'Manual',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '\$80,000',
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
