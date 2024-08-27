import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/car_bloc.dart';

class CarsFilterBar extends StatefulWidget {
  const CarsFilterBar({super.key});

  @override
  State<CarsFilterBar> createState() => _CarsFilterBarState();
}

class _CarsFilterBarState extends State<CarsFilterBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<CarBloc, CarState>(
      bloc: carsBloc,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(
            left: 15,
            bottom: 5,
          ),
          height: size.height * 0.04,
          child: ListView.builder(
            itemCount: carsBloc.types?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              var item = carsBloc.types?[i];
              return InkWell(
                onTap: () {
                  if (item != 'All') {
                    carsBloc.add(SearchCarsEvent(item ?? ''));
                  } else {
                    carsBloc.add(GetCarsEvent());
                  }
                  setState(() {
                    _selectedIndex = i;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedIndex != i ? Colors.black26 : Colors.blue,
                      width: 1,
                    ),
                    color:
                        _selectedIndex != i ? Colors.transparent : Colors.blue,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Container(
                    color:
                        _selectedIndex != i ? Colors.transparent : Colors.blue,
                    margin: const EdgeInsets.symmetric(horizontal: 7.0),
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Center(
                      child: Text(
                        item ?? '',
                        style: TextStyle(
                          color:
                              _selectedIndex != i ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
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
