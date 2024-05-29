import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/confirmPayment.dart';
import 'package:norld/widgets/mainBtn.dart';

class TokenPayBottom extends StatefulWidget {
  const TokenPayBottom({super.key});

  @override
  State<TokenPayBottom> createState() => _TokenPayBottomState();
}

class _TokenPayBottomState extends State<TokenPayBottom> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.35,
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
            'Для оплаты требуется\n0000 токенов',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: h * 0.045),
            child: Text('списать с вашего кошелька?',
                style: TextStyle(fontSize: 14, color: grey),
                textAlign: TextAlign.center),
          ),
          MainBtn(
            text: 'Кошелек',
            fontsize: 15,
            sw: w,
            sh: 0.07,
            fontweight: FontWeight.w600,
            callback: () {
              Get.back();
              Get.bottomSheet(const ConfirmPayBottom(),
                  backgroundColor: bottomSheet);
            },
          )
        ],
      ),
    );
  }
}
