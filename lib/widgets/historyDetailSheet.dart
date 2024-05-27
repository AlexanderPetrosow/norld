import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/mainBtn.dart';

class HistoryDetailSheet extends StatelessWidget {
  const HistoryDetailSheet({super.key, required this.send});

  final bool send;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        width: w,
        height: h * (send ? 0.57 : 0.62),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.03),
          child: Column(
            crossAxisAlignment:
                send ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              send
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(bottom: h * 0.02),
                      child: SizedBox(
                          width: w * 0.1,
                          child: SvgPicture.asset(
                            'assets/images/b_wallet.svg',
                            width: w * 0.1,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center,
                          )),
                    ),
              send
                  ? Container()
                  : Text(
                      'Отправлено!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.05),
                    ),
              send
                  ? Text(
                      'Перевод средств',
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.05),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.02),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w * 0.39,
                        child: Text(
                          'Переводу средств выполнен:',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.04),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.49,
                        child: Text(
                          '2023-09-19 20:35:78',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: white, fontSize: w * 0.04),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w * 0.39,
                        child: Text(
                          'Статус',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.04),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.49,
                        child: Text(
                          'Запрос обрабатывается',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: white, fontSize: w * 0.04),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w * 0.39,
                        child: Text(
                          'Сумма',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.04),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.49,
                        child: Text(
                          '252 ETH',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: grey, fontSize: w * 0.04),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w * 0.39,
                        child: Text(
                          'Адрес',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.04),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.49,
                        child: Text(
                          '3bhJIfBHB76bj7BJBGFhgbd6bhknbdh887nbnjhhbfhjdv4sD',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: grey, fontSize: w * 0.04),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w * 0.39,
                        child: Text(
                          'Ссылка',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.04),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.49,
                        child: Text(
                          '3bhJIfBHB76bj7BJBGFhgbd6',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            shadows: [
                              Shadow(color: white, offset: const Offset(0, -3))
                            ],
                            fontSize: w * 0.04,
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: white,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.02),
                child: MainBtn(
                  text: send ? 'Хорошо' : 'Посмотреть',
                  callback: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
