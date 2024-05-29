import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/flagBottomsheet.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:norld/widgets/paymantVarBottomsheet.dart';
import 'package:norld/widgets/sortBottomMenu.dart';

class OneMyLandBottom extends StatefulWidget {
  const OneMyLandBottom({super.key});

  @override
  State<OneMyLandBottom> createState() => _OneMyLandBottomState();
}

class _OneMyLandBottomState extends State<OneMyLandBottom> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.79,
      padding: EdgeInsets.only(
          top: h * 0.029, left: w * 0.05, right: w * 0.05, bottom: h * 0.029),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.009),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/images/landtest2.png',
                      width: w * 0.47,
                    ),
                    Positioned(
                      right: 0,
                      bottom: -h * 0.005,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.bottomSheet(
                            const FlagBottom(),
                            backgroundColor: bottomSheet,                            
                            );
                        },
                        child: Container(
                          width: w * 0.16,
                          height: w * 0.16,
                          alignment: Alignment.center,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, color: bg10),
                          child: 
                          SvgPicture.asset(
                            'assets/images/edit.svg',
                            width: w * 0.048,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
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
          Padding(
            padding: EdgeInsets.only(top: h * 0.009, bottom: 4),
            child: Text(
              'Название земли',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: [
              Text('Тип: ', style: TextStyle(color: grey, fontSize: 14)),
              Text('Пустыня', style: TextStyle(fontSize: 14)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.019, bottom: h * 0.029),
            child: Text(
                'Цена вопроса не важна, когда героям были возданы соответствующие почести. И еще немного описания',
                style: TextStyle(fontSize: 14, color: grey)),
          ),
          Text('Разведка:', style: TextStyle(fontSize: 14, color: grey)),
          Padding(
            padding: EdgeInsets.only(top: 4, bottom: h * 0.019),
            child: Text('Процент разведки: 65%',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: grey2)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.037),
            child: Stack(
              children: [
                Container(
                  width: w,
                  height: 7,
                  decoration: BoxDecoration(
                      color: bg8.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(
                  width: w * (0.65 - 0.05),
                  height: 7,
                  decoration: BoxDecoration(
                      color: snackbar,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: primary.withOpacity(0.5),
                            blurRadius: 21)
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    for (var i = 0; i < 3; i++)
                      Container(
                        width: 2,
                        height: 7,
                        color: bg9,
                      ),
                    SizedBox(),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Стоимость:', style: TextStyle(fontSize: 14, color: grey)),
              Text('3 267 152 \$',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.026),
            child: Row(
              children: [
                Container(
                  width: h * 0.07,
                  height: h * 0.07,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: snackbar.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(width: 1, color: snackbar),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/ctg_map_wt.svg',
                    width: w * 0.064,
                  ),
                ),
                MainBtn(
                  sw: 0.73,
                  sh: 0.07,
                  fontsize: 15,
                  fontweight: FontWeight.w600,
                  callback: () {
                    Get.back();
                    Get.bottomSheet(
                        isScrollControlled: true,
                        const PaymentVarBottom(),
                        backgroundColor: bottomSheet);
                  },
                  text: 'Продать',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
