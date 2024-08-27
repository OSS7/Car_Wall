import 'package:flutter/material.dart';

import '../bloc/car_bloc.dart';

class CarsSearchBar extends StatelessWidget {
  const CarsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffEFFAF0),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search cars',
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ),
          onChanged: (text) {
            debugPrint(text);
            carsBloc.add(SearchCarsEvent(text.toString()));
          },
        ),
      ),
    );
  }
}
