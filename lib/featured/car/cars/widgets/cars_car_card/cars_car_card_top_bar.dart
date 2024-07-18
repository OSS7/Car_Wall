import 'package:flutter/material.dart';

class CarsCarCardTopBar extends StatelessWidget {
  const CarsCarCardTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      // color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            // width: 80,
            // height: 25,
            child: Text(
              'Best Offer',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Icon(
            Icons.favorite,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
