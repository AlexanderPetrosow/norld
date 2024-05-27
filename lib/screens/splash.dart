import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/main.dart';
import 'package:norld/screens/firstScreen.dart';
import 'package:norld/screens/home.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    update();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void update() {
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer timer) {
        if (mounted) {
          setState(() {
            timer.cancel();
          });
          Get.offAll(() => tokenBox?.read('token') == null
              ? const FirstPage()
              : const HomePage());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // Obx(() =>
        Scaffold(
      backgroundColor: mainColor1,
      body: Container(
        decoration: BoxDecoration(gradient: bgGradient),
        child: const RiveAnimation.asset(
          'assets/images/splash.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
    // );
  }
}
