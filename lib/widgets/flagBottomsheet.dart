import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/screens/home.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:norld/widgets/paymantVarBottomsheet.dart';

class FlagBottom extends StatefulWidget {
  const FlagBottom({super.key});

  @override
  State<FlagBottom> createState() => _FlagBottomState();
}

class _FlagBottomState extends State<FlagBottom> {
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
                  'assets/images/image_icon_blue.svg',
                  height: h * 0.033,
                ),
              ),
              Text(
                'У вас нет флага',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
             Padding(
            padding: EdgeInsets.only(top: h * 0.019),
            child: Text('Установить флаг для земли?',
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
                       Get.back();
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
                          'Отмена',
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    MainBtn(
                      text: 'Выбрать стиль',
                      fontsize: 14,
                      sw: 0.43,
                      sh: 0.067,
                      fontweight: FontWeight.w600,
                      callback: () {
                          Get.back();
                       
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
