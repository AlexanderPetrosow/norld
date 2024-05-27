import 'package:flutter/material.dart';
import 'package:norld/global/colors.dart';


class Radiobtn extends StatelessWidget {
  final int selectedValue;
  final String label;
  final int value;
  final ValueChanged<int?> onChanged;

  Radiobtn({
    Key? key,
    required this.selectedValue,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.2,
          child: Radio<int>(
            value: value,
            groupValue: selectedValue,
            activeColor: white,
            visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity, vertical: 0),
            onChanged: onChanged,
          ),
        ),
        SizedBox(width: w * 0.042),
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: white),
        ),
      ],
    );
  }
}