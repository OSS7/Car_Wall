import 'package:carwall/core/constant/colors.dart';
import 'package:carwall/featured/car/cars/widgets/cars_body.dart';
import 'package:carwall/featured/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../services/services_view.dart';
import 'bloc/car_bloc.dart';

class CarsView extends StatefulWidget {
  const CarsView({super.key});

  @override
  State<CarsView> createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  int selectedIndex = 0;
  void _onItemTapped(int i) {
    setState(() {
      selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocBuilder<CarBloc, CarState>(
        bloc: carsBloc..add(GetCarsEvent()),
        builder: (context, state) {
          List screens = [
            CarsBody(
              state: state,
            ),
            const ServicesView(),
          ];
          return Scaffold(
            backgroundColor: cWhite,
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              backgroundColor: cWhite,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.car_crash_sharp),
                  label: 'Cars',
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_repair_service),
                  label: 'Services',
                  backgroundColor: Colors.green,
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: cPrimary,
              onTap: _onItemTapped,
            ),
            body: screens[selectedIndex],
          );
        },
      ),
    );
  }
}
