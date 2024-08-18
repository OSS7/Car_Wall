import 'package:flutter/material.dart';

class CarsCarCardTopBar extends StatefulWidget {
  const CarsCarCardTopBar({super.key});

  @override
  State<CarsCarCardTopBar> createState() => _CarsCarCardTopBarState();
}

class _CarsCarCardTopBarState extends State<CarsCarCardTopBar> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      // color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // margin: EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            // width: 80,
            // height: 25,
            child: const Text(
              'For sale',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.blueAccent : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
