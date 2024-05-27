import 'package:flutter/material.dart';

class OneLandBottom extends StatefulWidget {
  const OneLandBottom({super.key});

  @override
  State<OneLandBottom> createState() => _OneLandBottomState();
}

class _OneLandBottomState extends State<OneLandBottom> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.79,
      padding: EdgeInsets.only(
          top: h * 0.029, left: w * 0.05, right: w * 0.05, bottom: h * 0.029),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            ],
          ),
    );
  }
}