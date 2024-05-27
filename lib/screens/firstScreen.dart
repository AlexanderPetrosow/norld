import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bounce/bounce.dart';
import 'package:get/get.dart';
import 'package:norld/global/colors.dart';
import 'package:norld/screens/reg.dart';
import 'package:norld/widgets/mainBtn.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool open = false;
  @override
  void initState() {
    super.initState();
    open = true;
  }

  @override
  Widget build(BuildContext context) {
    // tokenBox?.write('token', 'E21KQubqkdTa4FGNmRewVzrgWAnMlfYL0yZB');
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    if (open) {
      openBottomSheet(notifPerm(w, h));
      open = false;
    }
    return Scaffold(
      backgroundColor: mainColor1,
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: h * 0.1,
              decoration: BoxDecoration(
                  color: mainColor1,
                  border: Border(bottom: BorderSide(color: border))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Bounce(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(w * 0.025),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: transparent),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: w * 0.04,
                          color: transparent,
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'logo',
                      child: SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: w * 0.3,
                        alignment: Alignment.center,
                      ),
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
          SizedBox(
            height: h * 0.85,
            child: Stack(children: [
              Image.asset(
                'assets/images/main_map.png',
                width: w,
                height: h,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Bounce(
                      onTap: () {
                        Get.snackbar("Ошибка", "В стадии разработки",
                            icon: SvgPicture.asset(
                              'assets/images/b_attention.svg',
                              width: w * 0.1,
                            ),
                            backgroundColor: snackbar);
                      },
                      child: Container(
                        padding: EdgeInsets.all(w * 0.04),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: mainColor2),
                        child: Icon(
                          Icons.near_me_rounded,
                          color: white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.02),
                      child: MainBtn(
                        callback: () => Get.to(() => const RegPage()),
                        // callback: () => openBottomSheet(notifPerm(w, h)),
                        text: "Начать игру",
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void openBottomSheet(Widget content) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          backgroundColor: transparent,
          context: context,
          builder: (builder) {
            double w = MediaQuery.of(context).size.width;
            double h = MediaQuery.of(context).size.height;
            return Container(
                height: h * 0.35,
                color: transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: bottomSheet,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(w * 0.1),
                            topRight: Radius.circular(w * 0.1))),
                    child: content));
          });
    });
  }

  Widget notifPerm(double w, double h) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Разрешите отправлять\nвам внутриигровые\nнотификации",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: white,
                fontSize: w * 0.06,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.02),
            child: Text(
              "Мы не будем слать рекламу и промо",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: grey,
                fontSize: w * 0.04,
              ),
            ),
          ),
          MainBtn(
              callback: () {
                Get.back();
                openBottomSheet(geoShare(w, h));
              },
              text: 'Продолжить')
        ],
      ),
    );
  }

  Widget geoShare(double w, double h) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Разрешите делится\nгеопозиций во время игры",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: white, fontSize: w * 0.06, fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.02),
            child: Text(
              "Это даст возможность покупать\nближайшие к Вам земли более удобно",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: grey,
                fontSize: w * 0.04,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Bounce(
                onTap: () => Get.back(),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: border2),
                      color: bg2,
                      borderRadius: BorderRadius.circular(w * 0.02)),
                  width: w * 0.43,
                  height: h * 0.07,
                  alignment: Alignment.center,
                  child: Text(
                    'Не разрешать',
                    style: TextStyle(color: white, fontSize: w * 0.04),
                  ),
                ),
              ),
              MainBtn(
                  sw: 0.43,
                  sh: 0.07,
                  callback: () => Get.back(),
                  text: 'Продолжить')
            ],
          )
        ],
      ),
    );
  }
}
