import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/variable.dart';

class TimeWork extends StatelessWidget {
  const TimeWork(
      {super.key,
      this.hour = 0,
      this.minute = 1,
      this.second = 30,
      required this.update});

  final int hour;
  final int minute;
  final int second;
  final Function() update;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return TimerCountdown(
      format: CountDownTimerFormat.hoursMinutesSeconds,
      endTime: gather.add(
        Duration(
          hours: hour,
          minutes: minute,
          seconds: second,
        ),
      ),
      onEnd: () {
        gameStatus = 2;
        update();
      },
      timeTextStyle: TextStyle(
        color: white,
        fontSize: w * 0.04,
      ),
      colonsTextStyle: TextStyle(
        color: white,
        fontSize: w * 0.04,
      ),
      descriptionTextStyle: TextStyle(
        color: white,
        fontSize: 0,
      ),
      spacerWidth: 0,
    );
  }
}
