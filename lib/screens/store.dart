import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:norld/class/userInfo.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/global/info.dart';
import 'package:norld/screens/testswitch.dart';
import 'package:norld/widgets/bottomMenu.dart';
import 'package:norld/widgets/filterBottomMenu.dart';
import 'package:norld/widgets/sortBottomMenu.dart';
import 'package:norld/widgets/storecard.dart';
import 'package:rive/rive.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;
  int? switchvalue = 0;

  bool loading = false;
  UserInfo? userInfo;

  @override
  void initState() {
    tabcontroller = TabController(vsync: this, length: 2);
    super.initState();
  }

  List<StoreCard> storeCards = List.generate(
    10,
    (index) =>
        StoreCard(currency: index % 3), // Alternating currencies for example
  );

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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Bounce(
                            onTap: () => Get.offAllNamed('/home'),
                            child: Container(
                              padding: EdgeInsets.all(w * 0.025),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: bg4),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: w * 0.035,
                                color: white,
                              ),
                            ),
                          ),
                          AnimatedToggleSwitch<int?>.rolling(
                              allowUnlistedValues: true,
                              styleAnimationType: AnimationType.onHover,
                              current: switchvalue,
                              values: const [0, 1, 2],
                              onChanged: (i) => setState(() => switchvalue = i),
                              iconList: [
                                SvgPicture.asset(
                                  'assets/images/currency1.svg',
                                  width: w * 0.04,
                                  color: switchvalue == 0 ? violet : white,
                                ),
                                SvgPicture.asset(
                                  'assets/images/currency2.svg',
                                  width: w * 0.04,
                                  color: switchvalue == 1 ? violet : white,
                                ),
                                SvgPicture.asset(
                                  'assets/images/currency1.svg',
                                  width: w * 0.04,
                                  color: switchvalue == 2 ? violet : white,
                                ),
                              ],
                              indicatorSize: Size(w * 0.06, w * 0.06),
                              spacing: w * 0.02,
                              height: h * 0.036,
                              borderWidth: 3,
                              style: ToggleStyle(
                                  borderColor: snackbar,
                                  backgroundColor: snackbar,
                                  indicatorColor: white,
                                  borderRadius: BorderRadius.circular(80))),
                        ],
                      ),
                      Positioned(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Магазин',
                            style: TextStyle(
                                color: white,
                                fontSize: w * 0.05,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ))
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   width: w,
                      //   height: h * 0.5,
                      //   child: const RiveAnimation.asset(
                      //     'assets/images/working.riv',
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      // Text(
                      //   'В разработке',
                      //   style: TextStyle(
                      //       color: white,
                      //       fontSize: w * 0.07,
                      //       fontWeight: FontWeight.w800),
                      // ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: border2),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: TabBar(
                          controller: tabcontroller,
                          unselectedLabelColor: grey2.withOpacity(0.74),
                          labelColor: grey2,
                          dividerColor: Colors.transparent,
                          unselectedLabelStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                          labelStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                          indicator: BoxDecoration(
                            color: snackbar,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: [
                            Tab(
                              text: 'Земли',
                              height: h * 0.05,
                            ),
                            Tab(
                              text: 'Ресурсы',
                              height: h * 0.05,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                      const FilterMenu(),
                                       isScrollControlled: true,
                                      backgroundColor: bottomSheet);
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/filter.svg',
                                      width: w * 0.04,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.025),
                                      child: Text(
                                        'Фильтрация',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: grey2),
                                      ),
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                      const SortMenu(),
                                      isScrollControlled: true,
                                      backgroundColor: bottomSheet);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: w * 0.0125),
                                      child: Text(
                                        'Сортировать',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: white),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: white,
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabcontroller,
                          children: <Widget>[
                            ListView(
                              padding: EdgeInsets.only(bottom: h * 0.1),
                              children: storeCards
                                  .where((card) => card.currency == switchvalue)
                                  .toList(),
                            ),
                            Center(child: Text('Content 2')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                BottomMenu(
                  menuId: groundBuy ? 3 : 1,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class HexagonImage extends StatelessWidget {
  final double size;
  final ImageProvider image;
  final Color borderColor;
  final double borderWidth;

  HexagonImage({
    required this.size,
    required this.image,
    this.borderColor = Colors.black,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter:
          HexagonPainter(borderColor: borderColor, borderWidth: borderWidth),
      child: ClipPath(
        clipper: HexagonClipper(),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent, width: borderWidth),
          ),
          child: ClipPath(
            clipper: HexagonClipper(),
            child: Image(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  HexagonPainter({required this.borderColor, required this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    Path path = Path();
    double width = size.width;
    double height = size.height;
    double sideLength = width / 2;
    double radius = 10;

    path.moveTo(width * 0.25 + radius, 0);
    path.lineTo(width * 0.75 - radius, 0);
    path.quadraticBezierTo(width * 0.75, 0, width * 0.75, radius);
    path.lineTo(width, height * 0.5 - radius);
    path.quadraticBezierTo(width, height * 0.5, width - radius, height * 0.5);
    path.lineTo(width * 0.75, height - radius);
    path.quadraticBezierTo(width * 0.75, height, width * 0.75 - radius, height);
    path.lineTo(width * 0.25 + radius, height);
    path.quadraticBezierTo(width * 0.25, height, width * 0.25, height - radius);
    path.lineTo(0, height * 0.5 + radius);
    path.quadraticBezierTo(0, height * 0.5, radius, height * 0.5);
    path.lineTo(width * 0.25, radius);
    path.quadraticBezierTo(width * 0.25, 0, width * 0.25 + radius, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    double sideLength = width / 2;
    double radius = 10;

    path.moveTo(width * 0.25 + radius, 0);
    path.lineTo(width * 0.75 - radius, 0);
    path.quadraticBezierTo(width * 0.75, 0, width * 0.75, radius);
    path.lineTo(width, height * 0.5 - radius);
    path.quadraticBezierTo(width, height * 0.5, width - radius, height * 0.5);
    path.lineTo(width * 0.75, height - radius);
    path.quadraticBezierTo(width * 0.75, height, width * 0.75 - radius, height);
    path.lineTo(width * 0.25 + radius, height);
    path.quadraticBezierTo(width * 0.25, height, width * 0.25, height - radius);
    path.lineTo(0, height * 0.5 + radius);
    path.quadraticBezierTo(0, height * 0.5, radius, height * 0.5);
    path.lineTo(width * 0.25, radius);
    path.quadraticBezierTo(width * 0.25, 0, width * 0.25 + radius, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
