import 'package:flutter/material.dart';
import 'package:norld/global/colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.controller,
    required this.label,
    this.inputType = TextInputType.text,
    this.errText,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final String? errText;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: errText != null ? red : grey),
          filled: errText != null ? true : false,
          fillColor: red.withOpacity(0.15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: border2),
            borderRadius: BorderRadius.circular(w * 0.03),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: border2),
            borderRadius: BorderRadius.circular(w * 0.03),
          ),
          errorText: errText,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: red),
            borderRadius: BorderRadius.circular(w * 0.03),
          )
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: border),
          //   borderRadius: BorderRadius.circular(w * 0.03),
          // ),
          ),
    );
  }
}
