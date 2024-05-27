import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/screens/home.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:rive/rive.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({super.key});

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  StateMachineController? controller;
  SMIInput<double>? state;
  double value = 0;

  double sw = 0;
  double sh = 0;

  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        decoration: BoxDecoration(gradient: bgGradient),
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 1,
              height: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: w * 0.2,
                  height: h * 0.15,
                  child: RiveAnimation.asset(
                    'assets/images/loading.riv',
                    onInit: (artboard) {
                      controller = StateMachineController.fromArtboard(
                          artboard, "Logics");
                      if (controller != null) {
                        artboard.addController(controller!);
                        state = controller?.findInput('scs');
                        state?.change(value);
                        timer = Timer.periodic(
                          const Duration(seconds: 4),
                          (Timer timer) {
                            if (mounted) {
                              setState(() {
                                sw = 1;
                                sh = 0.075;
                                state?.change(1);
                                timer.cancel();
                              });
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
                Text(
                  'Мы создали для\nвас кошелек',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: white,
                      fontSize: w * 0.07,
                      fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.03),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Свою seed фразу Вы можете\nпосмотреть в личном кабинете',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: grey,
                        fontSize: w * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: h * 0.05),
              child: AnimatedContainer(
                width: w * sw,
                height: h * sh,
                duration: const Duration(milliseconds: 300),
                child: MainBtn(
                    callback: () => Get.offAll(() => const HomePage()),
                    text: 'Продолжить'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
