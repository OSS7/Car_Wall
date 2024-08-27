import 'dart:ffi';

import 'package:carwall/core/constant/colors.dart';
import 'package:carwall/core/widgets/custom_map.dart';
import 'package:carwall/featured/services/cubit/service_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_date_picker.dart';
import '../../../core/widgets/custom_drop_down.dart';
import '../../../core/widgets/custom_snack_bars.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../car/cars/widgets/cars_top_bar.dart';
import '../model/drop_down_item_model.dart';
import 'services_dynamic_fields.dart';

class ServicesBody extends StatefulWidget {
  const ServicesBody({super.key});

  @override
  State<ServicesBody> createState() => _ServicesBodyState();
}

class _ServicesBodyState extends State<ServicesBody> {
  // MapController mapController = MapController();
  final _nameController = TextEditingController();
  String? formType = '';
  String? chosenService;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CarsTopBar(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Name',
                  control: _nameController,
                  onTap: () {},
                ),
                CustomTextField(
                  hintText: 'Phone number',
                  control: TextEditingController(),
                  onTap: () {},
                ),
                CustomDropDown(
                  title: 'Services',
                  // showTitle: 'He',
                  items: serviceCubit.services.toList(),
                  onPress: (s) {
                    setState(() {
                      chosenService = s.name;
                      formType = s.value;
                    });
                  },
                ),
                ServicesDynamicFields(
                  formType: formType ?? '',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: 'Submit Request',
                  onPress: () {
                    if (chosenService != null) {
                      FirebaseFirestore.instance.collection('requests').add({
                        'name': _nameController.text,
                        'service': chosenService,
                        'date': DateTime.now().toIso8601String(),
                      });
                    } else {
                      CustomSnackBar.showCustomErrorSnackBar(
                        message: 'Please Select a Service',
                        title: 'Error',
                      );
                    }
                  },
                  backgroundColor: cPrimary,
                  foregroundColor: cWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
