import 'package:flutter/material.dart';

import 'widgets/cars_search_bar.dart';
import 'widgets/cars_top_bar.dart';

class CarsView extends StatelessWidget {
  const CarsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          CarsTopBar(),
          CarsSearchBar(),
        ],
      ),
    );
  }
}
