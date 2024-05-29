import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/variable.dart';
import 'package:norld/widgets/timework.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({
    super.key,
    this.menuId = 0,
  });

  final int menuId;

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  List menu = [
    {
      'icon': 'assets/images/ctg_map.svg',
      'label': 'Карта',
      'route': '/home',
      'status': false
    },
    {
      'icon': 'assets/images/ctg_ground.svg',
      'label': 'Мои земли',
      'route': '/myGround',
      'status': false
    },
    {'icon': '', 'label': '', 'route': '', 'status': false},
    {
      'icon': 'assets/images/ctg_store.svg',
      'label': 'Магазин',
      'route': '/store',
      'status': false
    },
    {
      'icon': 'assets/images/ctg_wallet.svg',
      'label': 'Кошелек',
      'route': '/wallet',
      'status': false
    }
  ];

  menuUpdate() {
    if (groundBuy == false) {
      menu.removeAt(1);
      menu.removeAt(1);
    }
  }

  @override
  void initState() {
    menuUpdate();
    super.initState();
  }

  void update() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    menu[widget.menuId]['status'] = true;

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: w,
          height: h * 0.15,
          color: transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: w,
                    height: h * 0.09,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(gradient: menuGradient),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(menu.length, ((index) {
                          if (menu[index]['icon'] == '') {
                            return SizedBox(
                              width: w * 0.3,
                            );
                          } else {
                            return GestureDetector(
                              onTap: () async {
                                await Get.offAllNamed(menu[index]['route']);
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                        sigmaX: 7.5,
                                        sigmaY: 7.5,
                                        tileMode: TileMode.decal),
                                    child: Container(
                                      width: w * 0.15,
                                      height: h * 0.05,
                                      decoration: BoxDecoration(
                                          gradient: menu[index]['status']
                                              ? actionGradient
                                              : LinearGradient(colors: [
                                                  transparent,
                                                  transparent
                                                ])),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        menu[index]['icon'],
                                        colorFilter: ColorFilter.mode(
                                            menu[index]['status']
                                                ? white
                                                : menuDeactive,
                                            BlendMode.srcATop),
                                        width: w * 0.1,
                                        height: h * 0.05,
                                        alignment: Alignment.center,
                                      ),
                                      Text(
                                        menu[index]['label'],
                                        style: TextStyle(
                                            color: menu[index]['status']
                                                ? white
                                                : menuDeactive,
                                            fontSize: w * 0.0275),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        })),
                      ],
                    ),
                  ),
                  groundBuy == false
                      ? Container()
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/menuAction.svg',
                              height: h * 0.12,
                              alignment: Alignment.bottomCenter,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (gameStatus == 0) {
                                  gather = DateTime.now();
                                  gameStatus = 1;
                                } else if (gameStatus == 1) {
                                  Get.snackbar("Необходимо подождать сбора",
                                      "Не больше одного пуша за игровую сессию",
                                      icon: SvgPicture.asset(
                                        'assets/images/b_attention.svg',
                                        width: w * 0.1,
                                      ),
                                      backgroundColor: snackbar,
                                      margin: EdgeInsets.symmetric(
                                          vertical: h * 0.12,
                                          horizontal: w * 0.03));
                                } else if (gameStatus == 2) {
                                  gameStatus = 0;
                                }
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                              child: Container(
                                  width: w * 0.3,
                                  height: h * 0.1,
                                  // color: red,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      gameStatus == 0
                                          ? SvgPicture.asset(
                                              'assets/images/shovel.svg',
                                              height: h * 0.06,
                                              alignment: Alignment.center,
                                            )
                                          : gameStatus == 1
                                              ? Text(
                                                  'Ресурсы\nчерез',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: white,
                                                      fontSize: w * 0.035),
                                                )
                                              : SvgPicture.asset(
                                                  'assets/images/chest.svg',
                                                  height: h * 0.06,
                                                  alignment: Alignment.center,
                                                ),
                                      gameStatus == 0
                                          ? Text(
                                              'Ресурсы',
                                              style: TextStyle(
                                                  color: white,
                                                  fontSize: w * 0.04),
                                            )
                                          : gameStatus == 1
                                              ? TimeWork(
                                                  minute: 0,
                                                  second: 10,
                                                  update: update,
                                                )
                                              : Text(
                                                  'Собрать',
                                                  style: TextStyle(
                                                      color: white,
                                                      fontSize: w * 0.04),
                                                ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
