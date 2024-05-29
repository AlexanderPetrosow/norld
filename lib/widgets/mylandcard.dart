import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:norld/widgets/oneMylandBottom.dart';
import 'package:norld/widgets/paymantVarBottomsheet.dart';

class MyLandCard extends StatefulWidget {
  const MyLandCard({
    super.key,
  });

  @override
  State<MyLandCard> createState() => _MyLandCardState();
}

class _MyLandCardState extends State<MyLandCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Widget currencyWidget;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.042, vertical: h * 0.019),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '% разведки:',
                        style: TextStyle(
                          fontSize: 12,
                          color: grey2.withOpacity(0.5),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '65%',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: grey2),
                          ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainBtn(
                        sw: 0.38,
                        sh: 0.052,
                        fontsize: 14,
                        callback: () {
                          Get.bottomSheet(const OneMyLandBottom(),
                              isScrollControlled: true,
                              backgroundColor: bottomSheet);
                        },
                        text: 'Подробнее',
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
                          child: SvgPicture.asset(
                            'assets/images/ctg_map_wt.svg',
                            width: w * 0.045,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
