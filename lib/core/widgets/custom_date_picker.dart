import 'package:carwall/core/constant/colors.dart';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final String hint;
  final Function(DateTime?)? onChanged;
  const CustomDatePicker({
    super.key,
    required this.hint,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: cPrimary),
    );
    return DateTimeFormField(
      canClear: false,
      hideDefaultSuffixIcon: true,
      initialValue: DateTime.now(),
      mode: DateTimeFieldPickerMode.date,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: border,
        enabledBorder: border,
        errorBorder: border.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: border,
        isDense: true,
        labelText: hint,
        hintText: hint,
        labelStyle: TextStyle(
          fontSize: 16,
          color: cPrimary,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: cPrimary,
        ),
        errorStyle: const TextStyle(
          fontSize: 16,
          color: Colors.red,
        ),
      ),
      style: TextStyle(
        fontSize: 16,
        color: cPrimary,
      ),
      onChanged: onChanged,
    );
  }
}
