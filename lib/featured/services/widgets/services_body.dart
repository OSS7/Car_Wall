import 'package:carwall/featured/services/cubit/service_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_drop_down.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../car/cars/widgets/cars_top_bar.dart';
import '../model/drop_down_item_model.dart';

class ServicesBody extends StatelessWidget {
  const ServicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarsTopBar(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Name',
                control: TextEditingController(),
                onTap: () {},
              ),
              CustomTextField(
                hintText: 'Phone number',
                control: TextEditingController(),
                onTap: () {},
              ),
              CustomTextField(
                hintText: 'Email',
                control: TextEditingController(),
                onTap: () {},
              ),
              CustomDropDown(
                title: 'Services',
                // showTitle: 'He',
                items: serviceCubit.services.toList(),
                onPress: (s) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
