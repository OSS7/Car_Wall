import 'package:flutter/material.dart';

class CarsTopBar extends StatelessWidget {
  const CarsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      // color: Colors.grey,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  child: const Icon(
                    Icons.location_on,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location'),
                  Text(
                    'San Francisco',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              child: const Icon(
                Icons.notification_important,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
