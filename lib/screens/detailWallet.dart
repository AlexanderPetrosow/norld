import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/variable.dart';
import 'package:norld/screens/exchange.dart';
import 'package:norld/screens/getPayment.dart';
import 'package:norld/screens/sendPayment.dart';
import 'package:norld/widgets/bottomMenu.dart';
import 'package:norld/widgets/historyDetailSheet.dart';
import 'package:norld/widgets/msgSheet.dart';

class DetailWalletPage extends StatefulWidget {
  const DetailWalletPage(
      {super.key,
      required this.id,
      required this.name,
      required this.icon,
      required this.balance});

  final int id;
  final String name;
  final String icon;
  final String balance;

  @override
  State<DetailWalletPage> createState() => _DetailWalletPageState();
}

class _DetailWalletPageState extends State<DetailWalletPage> {
  bool loading = false;

  List btns = [
    {
      'name': 'Отправить',
      'callback': (() async {
        bool res = await Get.to(() => const SendPaymentPage());
        if (res) {
          Get.bottomSheet(
              HistoryDetailSheet(
                send: false,
              ),
              backgroundColor: bottomSheet,
              isScrollControlled: true);
        }
      })
    },
    {
      'name': 'Получить',
      'callback': (() async {
        bool res = await Get.to(() => const GetPaymentPage());
        if (res) {
          Get.bottomSheet(
              const MsgSheet(
                description: 'Вам пришли',
                title: '252 ETH',
              ),
              backgroundColor: bottomSheet);
        }
      })
    },
    {
      'name': 'Обменять',
      'callback': (() async {
        bool res = await Get.to(() => const ExchangePage());
        if (res) {
          Get.bottomSheet(
              const MsgSheet(
                title: 'Обмен прошел\nуспешно!',
              ),
              backgroundColor: bottomSheet);
        }
      })
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed('/home');
        return true;
      },
      child: Scaffold(
        backgroundColor: mainColor1,
        body: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(gradient: bgGradient2),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  height: h * 0.1,
                  decoration: BoxDecoration(
                    color: transparent,
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: bg4),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: w * 0.035,
                              color: white,
                            ),
                          ),
                        ),
                        Text(
                          'Кошелек',
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
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: w * 0.05, right: w * 0.05, bottom: h * 0.025),
                        child: Container(
                          padding: EdgeInsets.all(w * 0.03),
                          decoration: BoxDecoration(
                              color: snackbar.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(w * 0.03)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        width: w * 0.1,
                                        height: h * 0.035,
                                        child: SvgPicture.asset(widget.icon,
                                            fit: BoxFit.fitHeight,
                                            alignment: Alignment.center),
                                      ),
                                      SvgPicture.asset(
                                          'assets/images/border_icon.svg',
                                          height: h * 0.09,
                                          width: w * 0.18,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: w * 0.05),
                                    child: Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontSize: w * 0.045,
                                          color: grey2.withOpacity(0.5)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.balance,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * 0.045,
                                        color: white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                                btns.length,
                                ((i) => Bounce(
                                      onTap: btns[i]['callback'],
                                      child: Container(
                                        width: w * 0.29,
                                        height: h * 0.07,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: primary,
                                            borderRadius: BorderRadius.circular(
                                                w * 0.03)),
                                        child: Text(
                                          btns[i]['name'],
                                          style: TextStyle(
                                              color: white, fontSize: w * 0.04),
                                        ),
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.04),
                        child: Container(
                          width: w,
                          height: h * 0.6,
                          decoration: BoxDecoration(
                              color: mainColor1,
                              border:
                                  Border.all(color: border2.withOpacity(0.25)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(w * 0.1),
                                  topRight: Radius.circular(w * 0.1))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: h * 0.03),
                                  child: Text(
                                    'История операция',
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * 0.06),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(w * 0.02),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: w * 0.27,
                                        child: Text(
                                          'Дата',
                                          style: TextStyle(
                                              color: grey, fontSize: w * 0.05),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.27,
                                        child: Text(
                                          'Действие',
                                          style: TextStyle(
                                              color: grey, fontSize: w * 0.05),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.27,
                                        child: Text(
                                          'Сумма',
                                          style: TextStyle(
                                              color: grey, fontSize: w * 0.05),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.04,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: w,
                                  height: h * 0.44,
                                  child: ListView(
                                    padding: EdgeInsets.only(
                                        top: 0, bottom: h * 0.1),
                                    children: [
                                      ...List.generate(
                                          10,
                                          ((i) => Bounce(
                                                onTap: () {
                                                  Get.bottomSheet(
                                                      HistoryDetailSheet(
                                                        send: true,
                                                      ),
                                                      backgroundColor:
                                                          bottomSheet,
                                                      isScrollControlled: true);
                                                },
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.all(w * 0.02),
                                                  decoration: BoxDecoration(
                                                      color: i % 2 == 0
                                                          ? Colors.black
                                                              .withOpacity(0.15)
                                                          : mainColor1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              w * 0.02)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: w * 0.27,
                                                        child: Text(
                                                          '11.02.23',
                                                          style: TextStyle(
                                                              color: white,
                                                              fontSize:
                                                                  w * 0.05),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: w * 0.27,
                                                        child: Text(
                                                          'Перевод',
                                                          style: TextStyle(
                                                              color: white,
                                                              fontSize:
                                                                  w * 0.05),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: w * 0.27,
                                                        child: Text(
                                                          '30 \$',
                                                          style: TextStyle(
                                                              color: white,
                                                              fontSize:
                                                                  w * 0.05),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: w * 0.04,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios_rounded,
                                                          color: white,
                                                          size: w * 0.03,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  BottomMenu(
                    menuId: groundBuy ? 4 : 2,
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
