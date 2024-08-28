
import 'package:carwall/core/constant/colors.dart';
import 'package:carwall/core/widgets/custom_map.dart';
import 'package:carwall/featured/services/cubit/service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_date_picker.dart';
import '../../../core/widgets/custom_drop_down.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../car/cars/widgets/cars_top_bar.dart';
import '../model/request_model.dart';

class ServicesBody extends StatefulWidget {
  const ServicesBody({super.key});

  @override
  State<ServicesBody> createState() => _ServicesBodyState();
}

class _ServicesBodyState extends State<ServicesBody> {
  LatLng _selectedLocation =
      const LatLng(36.191712543630416, 44.00969088752672);
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String formType = '';
  DateTime? checkDate;
  String? chosenService;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const CarsTopBar(),
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
                  control: _phoneController,
                  onTap: () {},
                ),
                CustomDropDown(
                  title: 'Services',
                  items: serviceCubit.services.toList(),
                  onPress: (s) {
                    setState(() {
                      chosenService = s.name;
                      formType = s.value ?? '';
                    });
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (formType.contains('location'))
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: size.height * 0.25,
                        child: CustomMap(
                          location: _selectedLocation,
                          onChange: (position, hasGesture) => setState(
                              () => _selectedLocation = position.center),
                        ),
                      ),
                    if (formType.contains('date'))
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: size.height * 0.08,
                        child: CustomDatePicker(
                          hint: '',
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => checkDate = value);
                            }
                          },
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: 'Submit Request',
                  onPress: () {
                    serviceCubit.addServiceRequest(
                      RequestModel(
                        name: _nameController.text,
                        phoneNumber: _phoneController.text,
                        service: chosenService,
                        location: _selectedLocation,
                        checkDate: checkDate,
                        createdDate: DateTime.now(),
                      ),
                    );
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
