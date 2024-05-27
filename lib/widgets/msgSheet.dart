import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/mainBtn.dart';

class MsgSheet extends StatelessWidget {
  const MsgSheet({
    super.key,
    this.description = '',
    this.title = '',
  });

  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
        width: w,
        height: h * 0.3,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.03),
          child: Column(
            children: [
              Padding(
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
              description != ''
                  ? Padding(
                      padding: EdgeInsets.only(bottom: h * 0.01),
                      child: Text(
                        description,
                        style: TextStyle(color: grey, fontSize: w * 0.04),
                      ),
                    )
                  : Container(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.05),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.02),
                child: MainBtn(
                  text: 'Посмотреть',
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
