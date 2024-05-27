import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.label,
    this.size,
    this.activeColor = Colors.blue,
    this.checkColor = Colors.white,
    this.borderColor = Colors.white,
    this.activeBorderColor = Colors.white,
    this.inactiveColor = Colors.transparent,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final double? size;
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final Color activeBorderColor;
  final Color inactiveColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Row(
      children: [        
        GestureDetector(
          onTap: () {
            onChanged(!value);
          },
          child: Container(
            width: w * 0.05,
            height: w * 0.05,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: value ? activeColor : inactiveColor,
              border: Border.all(color: value ? activeBorderColor : borderColor),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: value
                ? Icon(
                    Icons.check,
                    color: checkColor,
                    size: w * 0.05 * 0.6,
                  )
                : null,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 16),),
      ],
    );
  }
}