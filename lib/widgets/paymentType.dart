import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/variable.dart';
import 'package:norld/widgets/paymantVarBottomsheet.dart';

class PaymentType extends StatelessWidget {
  PaymentType({super.key, required this.onTap, required this.label, required this.sum, required this.currency, required this.isSelect});
  Function () onTap;
  String label;
  double sum;
  int? currency;
  bool isSelect;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Widget currencyw;
    if (currency == 0) {
      currencyw = Container(
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
    } else {
      currencyw = Container(
                        width: w * 0.056,
                        height: w * 0.056,
                        margin: EdgeInsets.only(left: w * 0.022),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: snackbar,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 21,
                              color: snackbar.withOpacity(0.51),
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/images/currency1.svg',
                          width: w * 0.029,
                        ),
                      );
    }
    return GestureDetector(
            onTap: onTap,
            child: Container(
              width: w,
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.064, vertical: h * 0.029),
                  margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  color: bg8.withOpacity(isSelect ? 0.12 : 0.06),
                  border: Border.all(width: 1, color: white.withOpacity(isSelect? 0.34 : 0)),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label, style: TextStyle(fontSize: 14)),
                  Row(
                    children: [
                      Text(sum.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                     currencyw
                    ],
                  )
                ],
              ),
            ),
          );
  }
}