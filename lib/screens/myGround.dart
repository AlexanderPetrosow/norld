import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:norld/class/userInfo.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/widgets/bottomMenu.dart';
import 'package:norld/widgets/filterBottomMenu.dart';
import 'package:norld/widgets/mylandcard.dart';
import 'package:norld/widgets/sortBottomMenu.dart';
import 'package:rive/rive.dart';

class MyGroundPage extends StatefulWidget {
  const MyGroundPage({super.key});

  @override
  State<MyGroundPage> createState() => _MyGroundPageState();
}

class _MyGroundPageState extends State<MyGroundPage> {
  bool loading = false;
  UserInfo? userInfo;

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
                        'Мои земли',
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
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(bottom: h * 0.025),
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             TextButton(
                //                 onPressed: () {
                //                   Get.bottomSheet(const FilterMenu(),
                //                       isScrollControlled: true,
                //                       backgroundColor: bottomSheet);
                //                 },
                //                 child: Row(
                //                   children: [
                //                     SvgPicture.asset(
                //                       'assets/images/filter.svg',
                //                       width: w * 0.04,
                //                     ),
                //                     Padding(
                //                       padding: EdgeInsets.only(left: w * 0.025),
                //                       child: Text(
                //                         'Фильтрация',
                //                         style: TextStyle(
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w600,
                //                             color: grey2),
                //                       ),
                //                     )
                //                   ],
                //                 )),
                //             TextButton(
                //                 onPressed: () {
                //                   Get.bottomSheet(const SortMenu(),
                //                       isScrollControlled: true,
                //                       backgroundColor: bottomSheet);
                //                 },
                //                 child: Row(
                //                   children: [
                //                     Padding(
                //                       padding: EdgeInsets.only(right: w * 0.0125),
                //                       child: Text(
                //                         'Сортировать',
                //                         style: TextStyle(
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w600,
                //                             color: white),
                //                       ),
                //                     ),
                //                     Icon(
                //                       Icons.keyboard_arrow_down,
                //                       color: white,
                //                     )
                //                   ],
                //                 ))
                //           ],
                //         ),
                //       ),
                //       Expanded(
                //         child: ListView(
                //             padding: EdgeInsets.only(bottom: h * 0.12),
                //             children: [
                //               for(var i = 0; i<10;i++)
                //               MyLandCard()
                //             ]),
                //       )
                //     ],
                //   ),
                // ),
                 SizedBox(
                        width: w,
                        height: h * 0.5,
                        child: const RiveAnimation.asset(
                          'assets/images/working.riv',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'В разработке',
                        style: TextStyle(
                            color: white,
                            fontSize: w * 0.07,
                            fontWeight: FontWeight.w800),
                      ),
                const BottomMenu(
                  menuId: 1,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
