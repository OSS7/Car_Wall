import 'package:carwall/featured/car/car_details/cubit/car_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import 'widgets/car_details_app_bar.dart';
import 'widgets/car_details_car_image.dart';
import 'widgets/car_details_details_section.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    print(arg);
    return BlocConsumer<CarDetailsCubit, CarDetailsState>(
      bloc: carDetailsCubit..getCarDetails(arg),
      listener: (context, state) {},
      builder: (context, state) {
        final _car = carDetailsCubit.car;
        return Scaffold(
          backgroundColor: cWhite,
          body: SizedBox(
            child: state is CarDetailsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is CarDetailsErrorState
                    ? const Text('state.,')
                    : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CarDetailsAppBar(),
                            CarDetailsCarImage(
                              image: _car?.image ?? '',
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: CarDetailsDetailsSection(
                                  car: _car,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        );
      },
    );
  }
}
