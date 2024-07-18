import 'package:flutter/material.dart';

class CarsFilterBar extends StatelessWidget {
  const CarsFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        bottom: 5,
      ),
      height: size.height * 0.04,
      child: ListView.builder(
        itemCount: lst.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: lst[i] != 'All' ? Colors.black26 : Colors.blue,
              width: 1,
            ),
            color: lst[i] != 'All' ? Colors.transparent : Colors.blue,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            color: lst[i] != 'All' ? Colors.transparent : Colors.blue,
            margin: const EdgeInsets.symmetric(horizontal: 7.0),
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Center(
                child: Text(
              lst[i],
              style: TextStyle(
                color: lst[i] != 'All' ? Colors.black : Colors.white,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

List<String> lst = [
  'All',
  'Seden',
  'Hatchback',
  'Convertions',
  'MPV',
  'Wagon',
  'SUV',
];
