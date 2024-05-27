import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/info.dart';
import 'package:norld/screens/detailWallet.dart';
import 'package:norld/widgets/bottomMenu.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  bool loading = false;

  List wallets = [
    {
      'name': 'Etherium',
      'icon': 'assets/images/etherium_icon.svg',
      'balance': '25',
      'route': ''
    },
    {
      'name': 'Matic',
      'icon': 'assets/images/matic_icon.svg',
      'balance': '25',
      'route': ''
    },
    {
      'name': 'Norld',
      'icon': 'assets/images/norld_icon.svg',
      'balance': '13245',
      'route': ''
    },
    {
      'name': 'Ресурсы',
      'icon': 'assets/images/shovel_icon.svg',
      'balance': '13245',
      'route': ''
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed('/home');
        return true;
      },
      child: Scaffold(
        backgroundColor: mainColor1,
        body: Column(
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
                        onTap: () => Get.offAllNamed('/home'),
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
                        'Кошелек',
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
                  child: ListView(
                    padding: EdgeInsets.only(top: 0, bottom: h * 0.12),
                    children: [
                      ...List.generate(
                          wallets.length,
                          ((i) => Padding(
                                padding: EdgeInsets.only(bottom: h * 0.015),
                                child: Bounce(
                                  onTap: () {
                                    Get.to(() => DetailWalletPage(
                                        id: i,
                                        name: wallets[i]['name'],
                                        icon: wallets[i]['icon'],
                                        balance: wallets[i]['balance']));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(w * 0.03),
                                    decoration: BoxDecoration(
                                        color: snackbar.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(w * 0.03)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  width: w * 0.1,
                                                  height: h * 0.035,
                                                  child: SvgPicture.asset(
                                                      wallets[i]['icon'],
                                                      fit: BoxFit.fitHeight,
                                                      alignment:
                                                          Alignment.center),
                                                ),
                                                SvgPicture.asset(
                                                    'assets/images/border_icon.svg',
                                                    height: h * 0.09,
                                                    width: w * 0.18,
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        Alignment.center),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: w * 0.05),
                                              child: Text(
                                                wallets[i]['name'],
                                                style: TextStyle(
                                                    fontSize: w * 0.045,
                                                    color:
                                                        grey2.withOpacity(0.5)),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              wallets[i]['balance'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: w * 0.045,
                                                  color: white),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: w * 0.05),
                                                child: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: white,
                                                  size: w * 0.04,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))),
                    ],
                  ),
                ),
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
