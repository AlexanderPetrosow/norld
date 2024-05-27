import 'package:flutter/material.dart';
import 'package:norld/global/colors.dart';

class LandSwitcher extends StatelessWidget {
  LandSwitcher(
      {super.key,
      required this.onChanged,
      required this.label,
      required this.valueSw});

  Function(bool) onChanged;
  String label;
  bool valueSw;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Padding(
     padding: EdgeInsets.only(bottom: h * 0.029),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: h * 0.036,
            child: Switch(
              inactiveTrackColor: grey4,
              inactiveThumbColor: white,
              activeTrackColor: primary2,
              activeColor: white,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              value: valueSw,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
