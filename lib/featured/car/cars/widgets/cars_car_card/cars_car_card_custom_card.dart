import 'package:flutter/material.dart';

class CarsCarCardCustomCard extends StatelessWidget {
  final Widget child;
  const CarsCarCardCustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        // color: Colors.black12,
      ),
      child: child,
    );
  }
}
