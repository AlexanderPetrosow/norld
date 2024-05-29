import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/variable.dart';
import 'package:norld/widgets/bottomMenu.dart';
import 'package:norld/widgets/mainBtn.dart';

class GetPaymentPage extends StatefulWidget {
  const GetPaymentPage({super.key});

  @override
  State<GetPaymentPage> createState() => _GetPaymentPageState();
}

class _GetPaymentPageState extends State<GetPaymentPage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: mainColor1,
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: h * 0.1,
              decoration: BoxDecoration(
                color: mainColor1,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Bounce(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(w * 0.025),
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, color: bg4),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: w * 0.035,
                          color: white,
                        ),
                      ),
                    ),
                    Text(
                      'Получить',
                      style: TextStyle(
                          color: white,
                          fontSize: w * 0.05,
                          fontWeight: FontWeight.w800),
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
          ),
          loading
              ? SizedBox(width: w, child: const LinearProgressIndicator())
              : Container(),
          SizedBox(
            height: h * (loading ? 0.86 : 0.865),
            child: Stack(children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: Column(
                    children: [
                      Text(
                        'Отправляйте только Токены Etherium на это адрес. Отправка любых других токенов может привести к их безвозвратной потере',
                        style: TextStyle(color: grey, fontSize: w * 0.04),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.03),
                        child: SvgPicture.asset(
                          'assets/images/line.svg',
                          fit: BoxFit.cover,
                          width: w,
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.9,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/border_qr.svg',
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.center,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/qr.png',
                                  width: w * 0.6,
                                  fit: BoxFit.fitWidth,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h * 0.03),
                                  child: SizedBox(
                                    width: w * 0.75,
                                    child: Text(
                                      '3bhJIfBHB76bj7BJBGFhgbd6bhknbdh887nbnjhhbfhjdv4sDFFSsdf',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: white, fontSize: w * 0.04),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Bounce(
                              onTap: () => Get.back(),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: border2),
                                    color: bg2,
                                    borderRadius:
                                        BorderRadius.circular(w * 0.02)),
                                width: w * 0.43,
                                height: h * 0.07,
                                alignment: Alignment.center,
                                child: Text(
                                  'Копировать',
                                  style: TextStyle(
                                      color: white, fontSize: w * 0.04),
                                ),
                              ),
                            ),
                            MainBtn(
                                sw: 0.43,
                                sh: 0.07,
                                callback: () => Get.back(result: true),
                                text: 'Поделиться')
                          ],
                        ),
                      )
                    ],
                  )),
              BottomMenu(
                menuId: groundBuy ? 4 : 2,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
