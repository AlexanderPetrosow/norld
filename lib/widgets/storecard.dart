import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/variable.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:norld/widgets/oneLandBottom.dart';
import 'package:norld/widgets/paymantVarBottomsheet.dart';

class StoreCard extends StatefulWidget {
  const StoreCard({super.key, required this.currency});
  final int currency;

  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Widget currencyWidget;
    if (widget.currency == 1) {
      currencyWidget = Container(
        width: w * 0.056,
        height: w * 0.056,
        margin: EdgeInsets.only(left: w * 0.022),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: violet,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 21,
              color: violet.withOpacity(0.38),
            ),
          ],
        ),
        child: SvgPicture.asset(
          'assets/images/currency_1.svg',
          width: w * 0.029,
        ),
      );
    } else if (widget.currency == 0) {
      currencyWidget = Text(
        '\$',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      );
    } else {
      currencyWidget = Text(
        '\$',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      );
    }

    return ValueListenableBuilder(
      valueListenable: isBuy,
      builder: (context, isbuy, _) {
        return GestureDetector(
          onTap: () {
            Get.bottomSheet(const OneLandBottom(), 
            isScrollControlled: true,
            backgroundColor: bottomSheet);
          },
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.042, vertical: h * 0.019),
            margin: EdgeInsets.only(bottom: h * 0.009),
            decoration: BoxDecoration(
              color: bg6.withOpacity(0.16),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: w * 0.066),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            'assets/images/landtest.png',
                            width: w * 0.24,
                          ),
                          Positioned(
                            right: 0,
                            bottom: -h * 0.005,
                            child: Image.asset(
                              'assets/images/flag.png',
                              width: w * 0.1,
                              height: h * 0.047,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.027),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Стоимость',
                              style: TextStyle(
                                fontSize: 12,
                                color: grey2.withOpacity(0.5),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '132',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                currencyWidget,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: h * 0.019),
                        child: Row(
                          children: [
                            Container(
                              height: w * 0.069,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: w * 0.018),
                              decoration: BoxDecoration(
                                color: bg7,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'LVL 30',
                                style: TextStyle(fontSize: 12, color: grey2),
                              ),
                            ),
                            isbuy
                                ? Container(
                                    height: w * 0.069,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 4),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: w * 0.018),
                                    decoration: BoxDecoration(
                                      color: bg7,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'На продаже',
                                      style: TextStyle(fontSize: 12, color: grey2),
                                    ),
                                  )
                                : SizedBox(),
                            Container(
                              width: w * 0.069,
                              height: w * 0.069,
                              margin: EdgeInsets.only(left: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: yellow,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 18,
                                    color: yellow.withOpacity(0.40),
                                  ),
                                ],
                              ),
                              child: SvgPicture.asset(
                                'assets/images/star.svg',
                                width: w * 0.032,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Название земли',
                        style: TextStyle(
                          color: grey2,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Северная Америка',
                        style: TextStyle(color: grey2, fontSize: 12),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.048),
                        child: isbuy
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isBuy.value = false;
                                  });
                                },
                                child: Container(
                                  width: w,
                                  height: h * 0.052,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: carrot.withOpacity(0.10),
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(width: 1, color: carrot),
                                  ),
                                  child: Text(
                                    'Отменить продажу',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MainBtn(
                                    sw: 0.38,
                                    sh: 0.052,
                                    fontsize: 14,
                                    callback: () {
                                      // setState(() {
                                      //   isBuy.value = true;
                                      // });
                                       Get.bottomSheet(
                                          const PaymentVarBottom(),
                                          isScrollControlled: true,
                                          backgroundColor: bottomSheet);
                                    },
                                    text: 'Купить',
                                  ),
                                  Container(
                                    width: h * 0.052,
                                    height: h * 0.052,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: snackbar.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(9),
                                      border: Border.all(width: 1, color: snackbar),
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 13,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
