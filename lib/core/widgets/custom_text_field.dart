import 'package:carwall/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hintText,
    this.maxLength,
    this.control,
    this.validate,
    this.onTap,
  });

  final String? hintText;
  int? maxLength;

  final FormFieldValidator<String>? validate;
  TextEditingController? control;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        // height: size.height  * 0.08,
        child: TextFormField(
          onTap: onTap,
          validator: validate,
          autovalidateMode: AutovalidateMode.disabled,
          maxLines: maxLength ?? 1,
          controller: control,
          style: TextStyle(fontSize: 14, color: cPrimary, letterSpacing: 1.8),
          cursorColor: cPrimary,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: cPrimary, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: cPrimary, width: 1),
            ),
            labelText: hintText,
            labelStyle: TextStyle(fontSize: 12, color: cPrimary),
            hintStyle: TextStyle(color: cPrimary),
            fillColor: cPrimary,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: cPrimary, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: cPrimary, width: 1),
            ),
            // suffixIcon: IconButton(
            //   icon: Icon(
            //     _obscureText ? Icons.visibility : Icons.visibility_off,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     setState(() {
            //       _obscureText = !_obscureText;
            //     });
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
