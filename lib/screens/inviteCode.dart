import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/class/statusCheck.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/main.dart';
import 'package:norld/request/getData.dart';
import 'package:norld/screens/createWallet.dart';
import 'package:norld/widgets/customField.dart';
import 'package:norld/widgets/mainBtn.dart';

class InviteCodePage extends StatefulWidget {
  const InviteCodePage({super.key});

  @override
  State<InviteCodePage> createState() => _InviteCodePageState();
}

class _InviteCodePageState extends State<InviteCodePage> {
  final controller = TextEditingController();
  bool loading = false;
  String? errText;

  @override
  Widget build(BuildContext context) {
    print(tokenBox?.read('token'));
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
                SizedBox(
                  height: h * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Код приглашение',
                        style: TextStyle(
                            color: white,
                            fontSize: w * 0.07,
                            fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.03),
                        child: Text(
                          'Противоположная точка зрения подразумевает, что явные признаки победы институционализации, вне зависимости от их уровня, должны быть своевременно верифицированы.',
                          style: TextStyle(
                            color: grey,
                            fontSize: w * 0.04,
                          ),
                        ),
                      ),
                      CustomField(
                        controller: controller,
                        errText: errText,
                        label: 'Код приглашения',
                        inputType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.03),
                        child: MainBtn(
                            callback: (() async {
                              if (controller.text.isNotEmpty) {
                                if (loading == false) {
                                  if (mounted) {
                                    setState(() {
                                      loading = true;
                                    });
                                  }
                                  try {
                                    StatusCheck res =
                                        await getConfirmInvitation(
                                            controller.text);
                                    if (res.status) {
                                      if (mounted) {
                                        setState(() {
                                          errText = null;
                                          loading = false;
                                        });
                                      }
                                      Get.offAll(
                                          () => const CreateWalletPage());
                                    } else {
                                      if (mounted) {
                                        setState(() {
                                          errText = '';
                                          loading = false;
                                        });
                                      }
                                    }
                                  } catch (e) {
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
                                    print(e);
                                    if (mounted) {
                                      setState(() {
                                        errText = '';
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
                        onTap: () {
                          Get.offAll(() => const CreateWalletPage());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Пропустить",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: white, offset: const Offset(0, -10))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
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
