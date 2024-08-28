import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/widgets/custom_date_picker.dart';
import '../../../core/widgets/custom_map.dart';

class ServicesDynamicFields extends StatefulWidget {
  final String formType;
  late String? date;
  ServicesDynamicFields({
    super.key,
    this.date,
    required this.formType,
  });

  @override
  State<ServicesDynamicFields> createState() => _ServicesDynamicFieldsState();
}

class _ServicesDynamicFieldsState extends State<ServicesDynamicFields> {
  LatLng _selectedLocation =
      const LatLng(36.191712543630416, 44.00969088752672);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (widget.formType.contains('location'))
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: size.height * 0.25,
            child: CustomMap(
              location: _selectedLocation,
              onChange: (position, hasGesture) =>
                  setState(() => _selectedLocation = position.center),
            ),
          ),
        if (widget.formType.contains('date'))
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            height: size.height * 0.08,
            child: CustomDatePicker(
              hint: '',
              onChanged: (value) {
                if (value != null) {
                  setState(() => widget.date = value.toString());
                }
              },
            ),
          ),
      ],
    );
  }
}
