import 'dart:async';

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/class/emailConfirm.dart';
import 'package:norld/class/signIn.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/info.dart';
import 'package:norld/main.dart';
import 'package:norld/request/getData.dart';
import 'package:norld/screens/inviteCode.dart';
import 'package:norld/widgets/customField.dart';
import 'package:norld/widgets/mainBtn.dart';

class EmailCodePage extends StatefulWidget {
  const EmailCodePage({super.key});

  @override
  State<EmailCodePage> createState() => _EmailCodePageState();
}

class _EmailCodePageState extends State<EmailCodePage> {
  final controller = TextEditingController();
  bool loading = false;
  String? errText;

  Timer timer = Timer(const Duration(milliseconds: 1), () {});
  int time = 5;
  bool sendCode = false;

  String msg = 'Запросить код повторно';

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (time == 1) {
          if (mounted) {
            setState(() {
              msg = 'Запросить код повторно';
              time = 5;
              sendCode = false;
              timer.cancel();
            });
          }
        } else {
          if (mounted) {
            setState(() {
              time--;
              msg = 'Запросить код повторно\n можно через $time (секунд)';
              sendCode = true;
            });
          }
        }
      },
    );
  }

  @override
  void initState() {
    controller.text = code;
    super.initState();
  }

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
      backgroundColor: transparent,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            decoration: BoxDecoration(gradient: bgGradient),
            width: w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * 0.1,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: transparent))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Bounce(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: EdgeInsets.all(w * 0.025),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: bg4),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: w * 0.035,
                              color: white,
                            ),
                          ),
                        ),
                        Hero(
                          tag: 'logo',
                          child: SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: w * 0.3,
                            alignment: Alignment.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(w * 0.02),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: transparent),
                          child: Icon(
                            Icons.near_me_rounded,
                            color: transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                loading
                    ? SizedBox(width: w, child: const LinearProgressIndicator())
                    : Container(),
                SizedBox(
                  height: h * 0.68,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.03),
                        child: Text(
                          'Введите код, который был отправлен на вашу почту',
                          style: TextStyle(
                              color: white,
                              fontSize: w * 0.07,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      CustomField(
                          errText: errText,
                          controller: controller,
                          label: 'Код'),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.03),
                        child: MainBtn(
                            block: loading,
                            callback: (() async {
                              if (controller.text.isNotEmpty) {
                                if (loading == false) {
                                  if (mounted) {
                                    setState(() {
                                      loading = true;
                                    });
                                  }
                                  try {
                                    EmailConfirm res =
                                        await getEmailConfirm(email, code);
                                    if (res.status) {
                                      token = res.body.token;
                                      tokenBox?.write('token', token);
                                      print(token);
                                      if (mounted) {
                                        setState(() {
                                          errText = null;
                                          loading = false;
                                        });
                                      }
                                      Get.to(() => const InviteCodePage());
                                    } else {
                                      errText = '';
                                      Get.snackbar("Код неверный!",
                                          "Требуется повторный ввод",
                                          icon: SvgPicture.asset(
                                            'assets/images/r_attention.svg',
                                            width: w * 0.1,
                                          ),
                                          snackPosition: SnackPosition.BOTTOM,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: w * 0.05,
                                              vertical: h * 0.03),
                                          backgroundColor: red);
                                      if (mounted) {
                                        setState(() {
                                          loading = false;
                                        });
                                      }
                                    }
                                  } catch (e) {
                                    // print(e);
                                    errText = '';
                                    Get.snackbar("Код неверный!",
                                        "Перейдите в сообщество в Телеграм, Дискорд для запроса кода приглашения",
                                        icon: SvgPicture.asset(
                                          'assets/images/r_attention.svg',
                                          width: w * 0.1,
                                        ),
                                        snackPosition: SnackPosition.BOTTOM,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: w * 0.05,
                                            vertical: h * 0.03),
                                        backgroundColor: red);
                                    if (mounted) {
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  }
                                }
                              } else {
                                if (mounted) {
                                  setState(() {
                                    errText = 'Заполните поля';
                                  });
                                }
                              }
                            }),
                            text: 'Отправить'),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (sendCode == false) {
                            startTimer();
                            SignIn res = await getSignIn(email);
                            if (res.status) {
                              if (mounted) {
                                setState(() {
                                  errText = null;
                                  code = res.body.code;
                                  controller.text = code;
                                  print('New code: ${res.body.code}');
                                });
                              }
                            }
                            Get.snackbar("Код отправлен",
                                "Новый код отправлен вам на почту",
                                icon: const Icon(Icons.done_rounded),
                                backgroundColor: snackbar);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            msg,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: white, offset: const Offset(0, -10))
                              ],
                              color: Colors.transparent,
                              decoration: sendCode
                                  ? TextDecoration.none
                                  : TextDecoration.underline,
                              decorationColor: white,
                              decorationThickness: 4,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
