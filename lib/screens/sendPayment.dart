import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/info.dart';
import 'package:norld/widgets/bottomMenu.dart';
import 'package:norld/widgets/customField.dart';
import 'package:norld/widgets/mainBtn.dart';
import 'package:norld/widgets/scanner.dart';

class SendPaymentPage extends StatefulWidget {
  const SendPaymentPage({super.key});

  @override
  State<SendPaymentPage> createState() => _SendPaymentPageState();
}

class _SendPaymentPageState extends State<SendPaymentPage> {
  bool loading = false;

  final addressControl = TextEditingController();
  String? errTextAddress;
  final sumControl = TextEditingController();
  String? errTextSum;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: mainColor1,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: h * 0.1,
                decoration: BoxDecoration(
                  color: mainColor1,
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
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, color: bg4),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: w * 0.035,
                            color: white,
                          ),
                        ),
                      ),
                      Text(
                        'Отправить',
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
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.02),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: w * 0.7,
                                // height: h * 0.08,
                                child: CustomField(
                                    errText: errTextAddress,
                                    controller: addressControl,
                                    label: 'Адрес'),
                              ),
                              Bounce(
                                onTap: (() async => addressControl.text =
                                    await scanBarcodeNormal(context)),
                                child: Container(
                                  height: h * 0.075,
                                  // padding: EdgeInsets.all(w * 0.045),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.045),
                                  decoration: BoxDecoration(
                                      color: white.withOpacity(0.05),
                                      border: Border.all(color: border2),
                                      borderRadius:
                                          BorderRadius.circular(w * 0.03)),
                                  child: SvgPicture.asset(
                                    'assets/images/scan.svg',
                                    height: h * 0.035,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.02),
                          child: CustomField(
                              errText: errTextSum,
                              controller: sumControl,
                              inputType: TextInputType.number,
                              label: 'Укажите сумму'),
                        ),
                        MainBtn(
                          text: 'Отправить',
                          callback: () {
                            errTextAddress = addressControl.text.isNotEmpty
                                ? null
                                : 'Заполните поля';
                            errTextSum = sumControl.text.isNotEmpty
                                ? null
                                : 'Заполните поля';
                            if (errTextAddress == null && errTextSum == null) {
                              Get.back(result: true);
                            } else {
                              if (mounted) {
                                setState(() {});
                              }
                            }
                          },
                        )
                      ],
                    )),
                BottomMenu(
                  menuId: groundBuy ? 4 : 2,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
