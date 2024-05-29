import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/variable.dart';
import 'package:norld/screens/home.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:norld/widgets/noMoneyBottomsheet.dart';
import 'package:norld/widgets/paymentType.dart';
import 'package:norld/widgets/tokenPayBottomsheet.dart';

class PaymentVarBottom extends StatefulWidget {
  const PaymentVarBottom({super.key});

  @override
  State<PaymentVarBottom> createState() => _PaymentVarState();
}

class _PaymentVarState extends State<PaymentVarBottom> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.51,
      padding: EdgeInsets.only(
          top: h * 0.049, left: w * 0.05, right: w * 0.05, bottom: h * 0.024),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: h * 0.019),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 27,
                  color: primary.withOpacity(0.65))
            ]),
            child: SvgPicture.asset(
              'assets/images/b_wallet.svg',
              width: w * 0.064,
            ),
          ),
          Text('Варианты покупки',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: h * 0.029),
            child: Text(
                'Выберите токены, за которые\nпредпочли бы купить землю',
                style: TextStyle(fontSize: 14, color: grey),
                textAlign: TextAlign.center),
          ),
          PaymentType(
            onTap: () {
              setState(() {
                isTokencoin.value = false;
                isUsd.value = true;
              });
            },
            label: 'Продается за SDT',
            sum: 4.33,
            currency: 1,
            isSelect: isUsd.value,
          ),
          PaymentType(
            onTap: () {
              setState(() {
                isUsd.value = false;
                isTokencoin.value = true;
              });
            },
            label: 'Продается за SOL',
            sum: 4.33,
            currency: 0,
            isSelect: isTokencoin.value,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAll(HomePage());
                  },
                  child: Container(
                    width: w * 0.43,
                    height: h * 0.067,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: bg2,
                        border: Border.all(width: 1, color: border2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'На главную',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                MainBtn(
                  text: 'Купить',
                  fontsize: 14,
                  sw: 0.43,
                  sh: 0.067,
                  fontweight: FontWeight.w600,
                  callback: () {
                      Get.back();
                    if (isUsd.value) {
                      Get.bottomSheet(const NoMoneyBottom(),
                          backgroundColor: bottomSheet);
                    } else {
                         Get.bottomSheet(const TokenPayBottom(),
                          backgroundColor: bottomSheet);
                    }
                  },
                )
              ],
            ),
          )
        
        ],
      ),
    );
  }
}
