import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/screens/home.dart';
import 'package:norld/screens/myGround.dart';
import 'package:norld/screens/testswitch.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:norld/widgets/paymantVarBottomsheet.dart';

class SuccessPayBottom extends StatefulWidget {
  const SuccessPayBottom({super.key});

  @override
  State<SuccessPayBottom> createState() => _SuccessPayBottomState();
}

class _SuccessPayBottomState extends State<SuccessPayBottom> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: w,
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
                  height: h * 0.033,
                ),
              ),
              Text(
                'Поздравляем с покупкой!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
             Padding(
            padding: EdgeInsets.only(top: h * 0.019),
            child: Text('Вам доступен 1 дополнительный\nреферальный код',
                style: TextStyle(fontSize: 14, color: grey),
                textAlign: TextAlign.center),
          ),
                Padding(
                padding: EdgeInsets.only(top: h * 0.057),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                       Get.to(HomePage());
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
                          'На карту',
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    MainBtn(
                      text: 'Мои земли',
                      fontsize: 14,
                      sw: 0.43,
                      sh: 0.067,
                      fontweight: FontWeight.w600,
                      callback: () {
                          Get.offAll(MyGroundPage());
                      },
                    )
                  ],
                ),
              )
           
            ],
          ),
        ),
      ],
    );
  }
}
